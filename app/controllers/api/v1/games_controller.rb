class Api::V1::GamesController < Api::V1::ApiController
  before_action :set_game, only: [:show, :question, :start]

  def create
    game = Game.create
    Player.create(game: game, user: current_user)

    render json: game, include: 'players.user'
  end

  def start
    ActionCable.server.broadcast "game_#{@game.id}", game: serialized
  end

  def show
    render json: @game, include: 'players.user'
  end

  def code
    code = params[:game][:code]
    between = (DateTime.now - 1.hour)..(DateTime.now + 1.hour)
    
    game = Game.where(
      code: code,
      created_at: between,
    ).first

    Player.where(game: game, user: current_user).first_or_create

    if game
      render json: game, include: 'players.user'
    else
      render json: { errors: "Game with this code does not exist" }, status: 404
    end
  end

  def question
    question = Question.where(game: @game, user: current_user).first_or_create

    if question.prompt == nil
      qt = QuestionTemplate.where.not(id: @game.questions.map(&:question_template_id)).order('random()').first
      question.update(prompt: qt.prompt)
    end

    render json: question
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end

end

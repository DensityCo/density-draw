class Api::V1::GamesController < Api::V1::ApiController
  before_action :set_game, only: [:show, :question, :start]

  def create
    @game = Game.create
    Player.create(game: @game, user: current_user)

    render json: @game, include: 'players.user,questions.answers'
  end

  def start
    @game.update(game_state: 'drawing')
    serialized = GameSerializer.new(@game).serializable_hash(include: [questions: [:answers], players: [:user]])
    ActionCable.server.broadcast "game_#{@game.id}", { status: "start_drawing", game: serialized }
    
    render json: @game, include: 'players.user,questions.answers'
  end

  def show
    render json: @game, include: 'players.user,questions.answers'
  end

  def code
    code = params[:code]
    between = (DateTime.now - 1.hour)..(DateTime.now + 1.hour)
    
    @game = Game.where(
      code: code,
      created_at: between,
    ).first

    if @game
      Player.where(game: @game, user: current_user).first_or_create

      serialized = GameSerializer.new(@game).serializable_hash(include: [questions: [:answers], players: [:user]])
      ActionCable.server.broadcast "game_#{@game.id}", { status: "player_joined", game: serialized }

      render json: @game, include: 'players.user,questions.answers'
    else
      render json: { errors: "Game with this code does not exist" }, status: 404
    end
  end

  def my_question
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

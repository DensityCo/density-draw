class Api::V1::QuestionsController < Api::V1::ApiController
  before_action :set_question, only: [:image]

  def image
    @question.image_url = params[:question][:image_url]
    @question.save
    
    @game = @question.game
    serialized = GameSerializer.new(@game).serializable_hash(include: [:questions, players: [:user]])
    ActionCable.server.broadcast "game_#{@game.id}", {
      status: "drawing_complete",
      game: serialized
    }

    render json: @question
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

end

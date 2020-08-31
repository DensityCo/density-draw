class Api::V1::QuestionsController < Api::V1::ApiController
  before_action :set_question, only: [:drawing, :answer]

  def drawing
    @question.image_url = params[:image_url]
    if @question.save
      @game = @question.game

      serialized = GameSerializer.new(@game).serializable_hash(include: [questions: [:answers], players: [:user]])
      ActionCable.server.broadcast "game_#{@game.id}", {
        status: "drawing_complete",
        game: serialized
      }

      start_guessing = !(@game.questions.map(&:image_url).include? nil)
      if start_guessing
        # set the first question as the current question
        # and then announce that we should start guessing
        first_question = @game.questions.first
        @game.update(current_question: first_question, game_state: 'guessing')

        serialized = GameSerializer.new(@game).serializable_hash(include: [questions: [:answers], players: [:user]])
        ActionCable.server.broadcast "game_#{@game.id}", {
          status: "start_guessing",
          game: serialized
        }
      end

      render json: @question
    else
      render json: @question.errors.full_messages, status: :unprocessable_entity
    end
  end

  def answer
    @answer = Answer.new(
      guess: params[:guess], 
      user: current_user,
      question: @question
    )

    if @answer.save
      serialized = GameSerializer.new(@game).serializable_hash(include: [questions: [:answers], players: [:user]])
      ActionCable.server.broadcast "game_#{@game.id}", {
        status: "answer_submitted",
        game: serialized
      }

      render json: @answer
    else
      render json: @answer.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

end

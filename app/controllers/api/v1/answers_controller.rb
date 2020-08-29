class Api::V1::AnswerwController < Api::V1::ApiController
  before_action :set_answer, only: [:update]

  def update
    if @answer.update(answer_params)
      render json: @answer
    else
      render json: @answer.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  
  def answer_params
    params.require(:answer).permit(:is_correct, :is_funny)
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

end

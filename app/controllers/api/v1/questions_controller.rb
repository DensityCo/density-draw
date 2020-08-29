class Api::V1::QuestionsController < Api::V1::ApiController
  before_action :set_question, only: [:images]

  def image
    @question.image_url = params[:question][:image_url]
    @question.save
    
    render json: question
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

end

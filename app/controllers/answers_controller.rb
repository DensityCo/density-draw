class AnswersController < InheritedResources::Base

  private

    def answer_params
      params.require(:answer).permit(:guess, :question_id)
    end

end

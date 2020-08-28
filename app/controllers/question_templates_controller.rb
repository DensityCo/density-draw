class QuestionTemplatesController < InheritedResources::Base

  private

    def question_template_params
      params.require(:question_template).permit(:prompt)
    end

end

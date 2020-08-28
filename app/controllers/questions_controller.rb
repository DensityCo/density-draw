class QuestionsController < InheritedResources::Base

  private

    def question_params
      params.require(:question).permit(:game_id, :user_id, :prompt, :image_url)
    end

end

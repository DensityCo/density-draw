class AddQuestionTemplateToQuestion < ActiveRecord::Migration[6.0]
  def change
    add_reference :questions, :question_template, null: true, foreign_key: true
  end
end

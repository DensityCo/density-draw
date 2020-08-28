class CreateQuestionTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :question_templates do |t|
      t.string :prompt

      t.timestamps
    end
  end
end

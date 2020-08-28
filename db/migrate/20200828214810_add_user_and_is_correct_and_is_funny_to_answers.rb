class AddUserAndIsCorrectAndIsFunnyToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_reference :answers, :user, null: false, foreign_key: true
    add_column :answers, :is_correct, :boolean
    add_column :answers, :is_funny, :boolean
  end
end

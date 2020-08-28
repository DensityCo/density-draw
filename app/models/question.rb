class Question < ApplicationRecord
  belongs_to :game
  belongs_to :user
  has_many :answers
end

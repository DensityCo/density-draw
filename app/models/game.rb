class Game < ApplicationRecord
  has_many :players
  has_many :users, through: :players
  has_many :questions
  belongs_to :current_question, class_name: 'Question', foreign_key: 'current_question_id'

  before_create :generate_code

  def generate_code
    self.code = SecureRandom.alphanumeric[0..3].upcase
  end
end

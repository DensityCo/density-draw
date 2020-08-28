class Game < ApplicationRecord
  has_many :players
  has_many :users, through: :players
  has_many :questions

  before_create :generate_code

  def generate_code
    self.code = SecureRandom.alphanumeric[0..3].upcase
  end
end

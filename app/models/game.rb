class Game < ApplicationRecord
  before_create :generate_code

  def generate_code
    self.code = SecureRandom.alphanumeric[0..3].upcase
  end
end

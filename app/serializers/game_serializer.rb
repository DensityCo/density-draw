class GameSerializer < ActiveModel::Serializer
  attributes :id, :game_state, :code, :current_question, :players, :questions

  has_many :players
  has_many :questions
  belongs_to :current_question
end

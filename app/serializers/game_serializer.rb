class GameSerializer < ActiveModel::Serializer
  attributes :id, :code

  has_many :players
  has_many :questions
end

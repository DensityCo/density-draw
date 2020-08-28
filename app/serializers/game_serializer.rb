class GameSerializer < ActiveModel::Serializer
  attributes :id, :code

  has_many :players
end

class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :prompt, :image_url
  has_one :game
  has_one :user
end

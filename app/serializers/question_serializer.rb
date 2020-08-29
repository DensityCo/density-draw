class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :prompt, :image_url
  has_many :answers
end

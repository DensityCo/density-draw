class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :prompt, :image_url
  belongs_to :game
  belongs_to :user
  has_many :answers
end

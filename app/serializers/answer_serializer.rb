class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :guess, :is_correct, :is_funny
  has_one :question
  has_one :user
end

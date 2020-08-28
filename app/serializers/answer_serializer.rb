class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :guess
  has_one :question
end

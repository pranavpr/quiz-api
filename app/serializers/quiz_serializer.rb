class QuizSerializer < ActiveModel::Serializer
  has_many :questions
  attributes :id, :title, :description
end

class QuestionSerializer < ActiveModel::Serializer
  has_many :choices
  belongs_to :quiz
  attributes :id, :title, :description, :photo
end

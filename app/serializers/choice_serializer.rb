class ChoiceSerializer < ActiveModel::Serializer
  attributes :id, :text
  belongs_to :question
end

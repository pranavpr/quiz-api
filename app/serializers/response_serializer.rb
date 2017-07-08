class ResponseSerializer < ActiveModel::Serializer
  attributes :id, :correct
  has_one :user
  has_one :question
  has_one :choice

  def correct
    object.choice.answer
  end
end

class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :teacher_id, :rating, :body

  belongs_to :user                  
end

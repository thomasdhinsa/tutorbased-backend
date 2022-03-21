class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :teacher_id, :rating, :body, :user_id

  belongs_to :user                  
end

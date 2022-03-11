class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :teacher_id, :rating, :body

  belongs_to :user                  
  belongs_to :teacher, class_name:"User", foreign_key:"teacher_id"
end

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :education, :bio, :subjects, :zipcode, :preferred_contact, :image_url, :email

  has_many :reviews  
  has_many :earned_reviews, class_name:"Review", foreign_key:"teacher_id" 
end

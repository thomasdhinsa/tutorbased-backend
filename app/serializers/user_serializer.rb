class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :education, :bio, :subjects, :zipcode, :preferred_contact, :image_url, :email, :is_teacher

  has_many :reviews  
  has_many :earned_reviews 
end

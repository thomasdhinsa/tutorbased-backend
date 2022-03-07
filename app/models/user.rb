class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :reviews  
  has_many :earned_reviews, class_name:"Review", foreign_key:"teacher_id" 
end

class User < ActiveRecord::Base
  attr_accessible :date_of_birth, :email, :firstname, :lastname, :password, :password_confirmation
  
  has_secure_password
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :firstname, :lastname, :presence => true, :format => { :with => /[a-zA-Z ]*/ }
  
  has_many :solutions, :inverse_of => :user
  has_many :problems, :through => :solutions
end

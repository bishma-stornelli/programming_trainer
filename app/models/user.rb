class User < ActiveRecord::Base
  attr_accessible :date_of_birth, :email, :firstname, :lastname, :password, :password_confirmation
  
  has_secure_password
end

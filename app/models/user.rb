class User < ActiveRecord::Base
  attr_accessible :date_of_birth, :email, :firstname, :lastname, :password_digest
end

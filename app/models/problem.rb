class Problem < ActiveRecord::Base
  attr_accessible :cod, :description, :input_format, :output_format, :title
  
  validates :cod, :description, :input_format, :output_format, :title, :presence => true
  validates :cod, :uniqueness => true
  
  has_many :test_cases
  has_many :solutions
  has_many :users, :through => :solutions
end

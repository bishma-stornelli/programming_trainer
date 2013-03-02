class TestCase < ActiveRecord::Base
  belongs_to :problem, :inverse_of => :test_cases
  attr_accessible :input, :max_time, :output, :title
  
  has_attached_file :input
  has_attached_file :output
  
  validates :problem, :title, :max_time, :input, :output, :presence => true
  validates :title, :uniqueness => {:scope => :problem_id}
end

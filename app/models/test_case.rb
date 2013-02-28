class TestCase < ActiveRecord::Base
  belongs_to :problem
  attr_accessible :input, :max_time, :output, :title
  
  validates :problem, :title, :max_time, :input, :output, :presence => true
  validates :title, :uniqueness => {:scope => :problem_id}
end

class TestCase < ActiveRecord::Base
  belongs_to :problem
  attr_accessible :input, :max_time, :output, :title
end

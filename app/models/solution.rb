class Solution < ActiveRecord::Base
  belongs_to :user
  belongs_to :problem
  attr_accessible :date, :status, :time_running, :file
  
  validates :user, :problem, :date , :status, :file, :presence => true
end

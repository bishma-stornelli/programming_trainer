class Solution < ActiveRecord::Base
  belongs_to :user, :inverse_of => :solutions
  belongs_to :problem, :inverse_of => :solutions
  attr_accessible :date, :status, :time_running, :file
  
  has_attached_file :file
  
  validates :user, :problem, :date , :status, :file, :presence => true
end

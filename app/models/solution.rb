class Solution < ActiveRecord::Base
  belongs_to :user, :inverse_of => :solutions
  belongs_to :problem, :inverse_of => :solutions
  attr_accessible :date, :status, :time_running, :file
  
  has_attached_file :file
  
  STATUS_OPTIONS = { 1 => "Correcto", 2 => "Tiempo excedido", 3 => "Incorrecto"}
  validates :user, :problem, :date , :status, :file, :presence => true
  validates :status, :inclusion => { :in => STATUS_OPTIONS.keys }
  
  after_initialize :default_values
  
  def status_display
    STATUS_OPTIONS[self.status.to_i]
  end

  private
	def default_values
		self.status ||= STATUS_PENDING
	end
end

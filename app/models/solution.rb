require 'timeout'
class Solution < ActiveRecord::Base
  belongs_to :user, :inverse_of => :solutions
  belongs_to :problem, :inverse_of => :solutions
  attr_accessible :date, :status, :time_running, :file
  
  has_attached_file :file
  
  STATUS_OPTIONS = { 1 => "Correcto", 2 => "Tiempo excedido", 3 => "Incorrecto", 4 => "Ejecutandose"}
  validates :user, :problem, :date , :status, :file, :presence => true
  validates :status, :inclusion => { :in => STATUS_OPTIONS.keys }
  
  after_initialize :default_values
  before_validation :set_current_date
  
  def status_display
    STATUS_OPTIONS[self.status.to_i]
  end
  
  def run
    begin
	  all_correct = true
	  tr = 0
	  puts "Empezando a correr casos de prueba"
	  problem.test_cases.each do |tc|
	    puts "Corriendo caso de prueba"
	    tinit = Time.now
		output = ''
	    Timeout.timeout(tc.max_time) do          
		  output = `ruby #{file.path} < #{tc.input.path}`
		end
		puts "Terminado de correr"

		tfin = Time.now
		tr += tfin - tinit
		solution = File.open(tc.output.path, "r").read
		puts output.inspect, solution.inspect
		all_correct &= output.gsub( / ?(?<!\n)\n(?!\n)/, ' ') == solution.gsub( /(?<!\n)\n(?!\n)/, ' ')
		break unless all_correct
      end
	  self.status = all_correct ? 1 : 3
	  self.time_running = tr
	rescue Timeout::Error
		self.status = 2
	end
	save
  end

  private
  def default_values
    self.status ||= 4
  end
  
  def set_current_date
    self.date ||= Date.current
  end
end

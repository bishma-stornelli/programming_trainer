class Problem < ActiveRecord::Base
  attr_accessible :cod, :description, :input_format, :output_format, :title, :test_cases_attributes
  
  validates :cod, :description, :input_format, :output_format, :title, :presence => true
  validates :cod, :uniqueness => true
  validate :one_test_case_at_least
  
  has_many :test_cases
  has_many :solutions
  has_many :users, :through => :solutions
  
  accepts_nested_attributes_for :test_cases, 
	:allow_destroy => true, 
	:reject_if => Proc.new{ |attrs| attrs[:title].blank? && attrs[:input].blank? && attrs[:output].blank? && attrs[:max_time].blank? }
	
  private
  
  def one_test_case_at_least
    errors.add(:base, "Debe haber al menos un caso de prueba para el problema") if test_cases.empty?
  end
end

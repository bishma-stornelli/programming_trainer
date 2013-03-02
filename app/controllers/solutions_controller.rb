class SolutionsController < ApplicationController
  before_filter :find_problem

  def index
    @solutions = @problem.solutions
  end
  
  def create
  end
  
  private
  
  def find_problem
    @problem = Problem.find(params[:problem_id])
	render_404 if @problem.nil?
  end
end
class SolutionsController < ApplicationController
  before_filter :find_problem

  def index
    @solutions = @problem.solutions
  end
  
  def create
	@solution = @problem.solutions.build(params[:solution])
	@solution.user = current_user
	@solution.save!
	@solution.run
	redirect_to :action => :index
  end
  
  private
  
  def find_problem
    @problem = Problem.find(params[:problem_id])
	render_404 if @problem.nil?
  end
end
class SessionsController < ApplicationController

  def new
    render 'new'
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "Welcome to Programming Trainer."
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid username/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to "/"
  end
end
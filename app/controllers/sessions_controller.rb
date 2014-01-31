class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user.nil?
      redirect_to(:back, notice: "user #{params[:username]} doesn't exist!")
    else
      session[:user_id] = user.id
      redirect_to(user_url(user), notice: "welcome back!")
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to(root_url)
  end
end


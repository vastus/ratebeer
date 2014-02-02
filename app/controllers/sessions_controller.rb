class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to(user_url(user), notice: "welcome back!")
    else
      redirect_to(:back, notice: "username and/or password mismatch")
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to(root_url)
  end
end


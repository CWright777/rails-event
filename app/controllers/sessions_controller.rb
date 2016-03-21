class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:user][:email].downcase)
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to "/events"
    else
      flash[:danger] = "Invalid email/password combo"
      redirect_to '/'
    end
  end
end

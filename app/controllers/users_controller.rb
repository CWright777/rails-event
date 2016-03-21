class UsersController < ApplicationController
  def index
    @user = User.new
    @location = Location.new
  end
  def create
    @location = Location.where("location = ? AND state = ?", params[:user][:location], params[:user][:state])
    
    unless @location.any?
      @location = Location.create(location_params)  
    end
    User.create(user_params)
    redirect_to root_path
  end

  private
    def location_params
      params.require(:user).permit(:location,:state)
    end
    def user_params
      params.require(:user).permit(:first_name,:last_name,:email,:password,:password_confirmation).merge(location: Location.where("location = ? AND state = ?", params[:user][:location], params[:user][:state])[0])
    end
end

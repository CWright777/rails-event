class EventsController < ApplicationController
  def index
    @local_events = Location.all.where("state = ?",current_user.location.state)
    @outside_events =  Location.all.where.not("state = ?",current_user.location.state)
  end

  def create
    @location = Location.where("location = ? AND state = ?", params[:event][:location], params[:event][:state])
    unless @location.any?
      @location = Location.create(location_params)
    end
    @event = Event.create(event_params)
    Relation.create(user: current_user,event: @event)
    redirect_to :back
  end
  
  private
    def location_params
      params.require(:event).permit(:location,:state)
    end
    def event_params
      p current_user
      params.require(:event).permit(:name,:date).merge(location: Location.where("location = ? AND state = ?", params[:event][:location], params[:event][:state])[0],user: current_user)
    end
end

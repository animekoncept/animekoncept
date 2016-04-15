class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find params[:id]
    @event.punch(request)
  end

  def attending
    @event = Event.find params[:id]
    current_user.mark_as_attending @event

    #@event.create_activity :attending, owner: current_user

    respond_to do |format|
			format.html {redirect_to @event}
			format.js
    end
  end

  def notattending
    @event = Event.find params[:id]
    @event.unmark :attending, :by => current_user

    #@event.create_activity :notattending, owner: current_user

    respond_to do |format|
      format.html {redirect_to @event}
      format.js
    end
  end
end

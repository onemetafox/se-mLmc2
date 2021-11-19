class EventsController < ApplicationController
  def index
    @event = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to '/events'
  end

  def show
    @event = Event.find(params[:id])
    @user = current_user
    if @user != nil
      addEvent(@event)
    return
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to '/dashboard', :notice => "You event has been updated."
    else
      render 'edit'
    end
  end

  def destroy
    @event = event.find(params[:id])
    @event.destroy
    flash[:success] = "Event destroyed."
    redirect_to '/dashboard'
  end

  private

  def event_params
      params.require(:event).permit(:name,:date,:time,:description)
  end

end

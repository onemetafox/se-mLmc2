class CalendarsController < ApplicationController
  def index
    @calendar = Calendar.where(:user_id => session[:user_id]).order("created_at DESC")
  end

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.new(calendar_params)
    @calendar.user_id = session[:user_id]
    @calendar.save
    redirect_to '/calendars'
  end

  def show
    @calendar = Calendar.all
  end

  def edit
    @calendar = Calendar.find(params[:id])
  end

  def update
    @calendar = Calendar.find(params[:id])

    if @calendar.update(calendar_params)
      redirect_to '/dashboard', :notice => "You calendar has been updated."
    else
      render 'edit'
    end
  end

  def destroy
    @calendar = calendar.find(params[:id])
    @calendar.destroy
    flash[:success] = "Calendar destroyed."
    redirect_to '/dashboard'
  end

  private

  def calendar_params
      params.require(:calendar).permit(:name,:date,:time,:description)
  end
end

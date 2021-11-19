class ApplicationController < ActionController::Base
  helper_method :current_user, :addEvent
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def addEvent(event)
    @event = event
    @calendar = Calendar.new(@event.attributes)
    @calendar.user_id = session[:user_id]
    @calendar.save
    redirect_to '/calendars'
  end

  def addGroup(group)
    @group = group
    @usergroup = UserGroup.new(@group.attributes)
    @usergroup.user_id = session[:user_id]
    @usergroup.save
    redirect_to '/user_groups'
  end
end

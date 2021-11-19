class UserGroupsController < ApplicationController
  def index
    @usergroup = UserGroup.all
  end

  def new
    @usergroup = UserGroups.new
  end

  def create
    @usergroup = UserGroups.new(usergroup_params)
    @usergroup.save
    redirect_to '/dashboard'
  end

  def show
    @usergroup = UserGroups.find(params[:id])
  end

  def edit
    @usergroup = UserGroups.find(params[:id])
  end

  def update
    @usergroup = UserGroups.find(params[:id])

    if @usergroup.update(opportunity_params)
      redirect_to '/dashboard', :notice => "You usergroup has been updated."
    else
      render 'edit'
    end
  end

  def destroy
    @usergroup = UserGroups.find(params[:id])
    @usergroup.destroy
    flash[:success] = "Group destroyed."
    redirect_to '/dashboard'
  end

  private

  def usergroup_params
      params.require(:usergroup).permit(:name,:mentor,:description)
  end
end

class ResourcesController < ApplicationController
    def index
        @resources = Resource.all.order("created_at DESC")
    end

    def new
        @resource = Resource.new
    end

    def create
        @resource = Resource.new(resource_params)
        @resource.save
        redirect_to '/dashboard'
    end

    def show
        @resource = Resource.find(params[:id])
      end
    
    def edit
        @resource = Resource.find(params[:id])
    end
    
    def update
        @resource = Resource.find(params[:id])
    
        if @resource.update(resource_params)
          redirect_to '/dashboard', :notice => "Resource updated."
        else
          render 'edit'
        end
    end
    
    def destroy
        @resource= resource.find(params[:id])
        @resource.destroy
        flash[:success] = "Resource destroyed."
        redirect_to '/dashboard'
    end

    private

    def resource_params
        params.require(:resource).permit(:name,:date,:time,:description)
    end
end

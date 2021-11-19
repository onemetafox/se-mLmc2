class TasksController < ApplicationController
    def index
        @tasks = Task.where(:user_id => session[:user_id]).order("created_at DESC")
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        @task.user_id = session[:user_id]
        @task.save
        redirect_to '/dashboard'
    end

    def show
        @tasks = Task.where(:user_id => session[:user_id]).order("created_at DESC")
    end
    
    def edit
        @task = Task.find(params[:id])
    end
    
    def update
        @task = Task.find(params[:id])
    
        if @task.update(task_params)
          redirect_to '/dashboard', :notice => "You task has been updated."
        else
          render 'edit'
        end
    end
    
    def destroy
        @task= task.find(params[:id])
        @task.destroy
        flash[:success] = "Task destroyed."
        redirect_to '/dashboard'
    end

    private

    def task_params
        params.require(:task).permit(:title,:date,:time,:description)
    end

end

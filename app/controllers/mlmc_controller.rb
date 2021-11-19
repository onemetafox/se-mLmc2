class MlmcController < ApplicationController
    def index
        @task = Task.new
        @tasks = Task.where(:user_id => session[:user_id]).order("created_at DESC")
    end
end

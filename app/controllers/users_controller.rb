class UsersController < ApplicationController

    def index
    end

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
    end

    def create
        redirect_to user_path(@user)
    end

    
end

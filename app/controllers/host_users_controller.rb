class HostUsersController < ApplicationController

    def index
    end
    
    def new
        @host_user = HostUser.new
    end

    def show
        @host_user = HostUser.find(params[:id])
    end

    def create
        redirect_to host_user_path(@host_user)
    end

end

class UsersController < ApplicationController

    def index
    end

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id]) 
        @host_users = HostUser.all                                                           
    end

    def create
        redirect_to user_path(@user)
    end

    def search
        @host_users = HostUser.search(params[:keyword])
        @host_user = HostUser.find(params[:id])
        respond_to do |format|
            format.html
            format.json
        end

        redirect_to users_path(@user)
    end

    private
    def user_params
      params.require(:user).permit(:name, :email, :host_user_id)
    end

    def ensure_correct_user
        if @current_user.id != params[:id].to_i
        flash[:notice] = "権限がありません"
        redirect_to("/posts/index")
       end
    end

    
end

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

    

    private
    def user_params
      params.require(:user).permit(:name, :email)
    end

    def ensure_correct_user
        if @current_user.id != params[:id].to_i
        flash[:notice] = "権限がありません"
        redirect_to("/posts/index")
       end
    end

    
end

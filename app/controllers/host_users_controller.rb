class HostUsersController < ApplicationController
    before_action :set_host_user, except: [:index, :search]

    def index
        @host_users = HostUser.all
        @host_user = HostUser.find(params[:id])
    end

    def show
        @host_user = HostUser.find(params[:id])
        @books = @host_user.books
    end

    def new
        @host_user = HostUser.new
    end

    def create
        @host_user = HostUser.new
        redirect_to host_user_path(@host_user)
    end

    def edit
        @host_user = HostUser.find(params[:id])
    end

    def update
        @host_user = HostUser.find(params[:id])
        if @host_user.update(host_user_params)
            @host_user.image="#{@host_user.id}.jpg"
            image=params[:image]
        end
        redirect_to host_user_path(@host_user)
    end

    def search
        @host_users = HostUser.search(params[:keyword])
        respond_to do |format|
            format.html
            format.json
        end
    end    

    private
    def host_user_params
        params.require(:host_user).permit(:name, :email, :image, :text)
    end

    def set_host_user
        @host_user = HostUser.find(params[:id])
    end

    def ensure_correct_user
        if @current_host_user.id != params[:id].to_i
        flash[:notice] = "権限がありません"
        redirect_to("/posts/index")
       end
    end

    
end

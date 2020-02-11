class BooksController < ApplicationController
    before_action :set_host_user, except: [:show, :create,:new]
    before_action :move_to_index, except: [:index, :new, :create, :show]


    def index    
        @books = @host_user.books.includes(:host_user)
    end

    def show
        @book = Book.find(params[:id])
        @host_user = @book.host_user
    end

    def new       
        @book = Book.new
    end

    def create 
        @book = Book.new(book_params)
        if @book = Book.create(book_params)
            @book.image = "#{@book.id}.jpg"  
            image=params[:image] 
        end
        redirect_to host_user_path(current_host_user)
    end



    private


    def book_params
        params.permit(:title, :text, :image, :start_dt, :end_dt, :id).merge(host_user_id: current_host_user.id )
    end

    def reservation_params
        params.permit(:id).merge(user_id: current_user.id)
    end

    def move_to_index
        redirect_to action: :index unless host_user_signed_in?
    end

    def set_host_user
        @host_user = HostUser.find(params[:host_user_id])
    end


end

class BooksController < ApplicationController
    before_action :set_host_user
    before_action :move_to_index, except: [:index, :create, :show]


    def index
        @books = @host_user.books.includes(:host_user)
    end

    def new
        @host_user = HostUser.find(params[:host_user_id])
        @book = Book.new
    end

    def create 
        @book = Book.new
        if @book = Book.create(book_params)
            @book.image = "#{@book.id}.jpg"  
            image=params[:image] 
        end
        redirect_to host_user_books_path(@host_user, @book)
    end



    private


    def book_params
        params.require(:book).permit(:title, :text, :image, :start_dt, :end_dt).merge(host_user_id: current_host_user.id )
    end

    def move_to_index
        redirect_to action: :index unless host_user_signed_in?
    end

    def set_host_user
        @host_user = HostUser.find(params[:host_user_id])
    end


end

class ReservationsController < ApplicationController
    before_action :set_book

    def create
        @reservation = Reservation.create(reservation_params)
        #binding.pry
        redirect_to user_path(current_user.id), notice:"予約が完了しました"
    end

    def index
        redirect_to user_path(current_user.id), notice:"予約が完了しました"
    end

    
    private

    def reservation_params
       params.require(:reservation).permit(:id).merge(user_id: current_user.id)
    end

    def set_book
        @book = Book.find(params[:book_id])
    end
    


end

class ReservationsController < ApplicationController

    def create
        @reservation = current_user.reservations.create(reservation_params)
        redirect_to root_path notice:"予約が完了しました"
    end

    def index
        @reservations = current_user.reservations.all
    end
 
    def lend
      @books = current_user.books
    end 

    
    private

    def reservation_params
       params.require(:reservation).permit(:start_date, :end_date, :book_id)
    end 


end

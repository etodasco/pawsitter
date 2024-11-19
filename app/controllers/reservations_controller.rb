class ReservationsController < ApplicationController
  def show
    @reservation = Reservation.find(params[:id])
    @message = Message.new
  end
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.restaurant = @restaurant
    @reservation.user = current_user
    if @reservation.save
      redirect_to @restaurant
    else
      render "restaurants/show"
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date)
  end
end

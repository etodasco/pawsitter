class ReservationsController < ApplicationController
  before_action :set_pet_sitter, except: [:show]
  def show
    @reservation = Reservation.find(params[:id])
    @message = Message.new
  end

  def new
    @reservation = Reservation.new
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

  def set_pet_sitter
    @pet_sitter = User.find(params[:pet_sitter_id])
  end

  def reservation_params
    params.require(:reservation).permit(:date)
  end
end

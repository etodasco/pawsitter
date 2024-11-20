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
    @reservation.pet_sitter = @pet_sitter
    @reservation.pet_owner = current_user

    if @reservation.save
      redirect_to @reservation
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def set_pet_sitter
    @pet_sitter = User.find(params[:pet_sitter_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end

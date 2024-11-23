class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pet_sitter, except: [ :index, :show]

  def index
    @reservations = current_user.sent_reservations
  end

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
    @reservation.status = "pending"
    
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
    params.require(:reservation).permit(:start_date, :end_date, pet_ids: [])
  end
end

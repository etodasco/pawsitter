class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pet_sitter, except: [ :index, :show, :update, :destroy ]

  def index
    @sent_reservations = current_user.sent_reservations
    @received_reservations = current_user.received_reservations
  end


  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.pet_sitter = @pet_sitter
    @reservation.pet_owner = current_user
    @reservation.status = "pending"
    @reservation.price = @pet_sitter.price_per_day * (@reservation.end_date - @reservation.start_date).to_i
    if @reservation.save
      redirect_to @reservation
    else
      render "new", status: :unprocessable_entity
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @message = Message.new
  end

  def destroy
    @reservation = Reservation.find_by(params[:reservation_id])

    if @reservation.destroy
       redirect_to reservations_path, notice: "Reservation deleted successfully."
   else
      redirect_to reservations_path, alert: "Failed to delete reservation."
    end
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(status: params[:status])
    redirect_to reservations_path, notice: "Reservation updated successfully"
  end

  private

  def set_pet_sitter
    @pet_sitter = User.find(params[:pet_sitter_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, pet_ids: [])
  end
end

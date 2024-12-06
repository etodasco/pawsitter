class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:home]

  def home
    @pet_sitters = User.where(pet_sitter: true).where.not(id: current_user.id)

    # Filter by address
    @pet_sitters = @pet_sitters.where("address ILIKE ?", "%#{params[:address]}%") if params[:address].present?

    # Filter by availability
    if params[:start_date].present? && params[:end_date].present?
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      @pet_sitters = @pet_sitters.joins(:reservations).where.not( # ERROR WITH THIS CODE
        reservations: { start_date: start_date..end_date, end_date: start_date..end_date }
      )
    end

    # Geocode users for map markers
    @markers = @pet_sitters.geocoded.map do |pet_sitter|
      {
        lat: pet_sitter.latitude,
        lng: pet_sitter.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { pet_sitter: pet_sitter }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def profile
    @user = current_user
    # animaux du user
    @pets = @user.pets

    # réservations pour Pet Owner
    @reservations_as_owner = @user.sent_reservations
    # réservations pour petsitter
    @reservations_as_petsitter = @user.received_reservations
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to profile_path, notice: "Profile updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def pet_sitter_profile
    @pet_sitter_profile = User.find(params[:id])
    @reservations_as_petsitter = @pet_sitter_profile.received_reservations
  end

  def show
    @user = User.find(params[:id])
    @pet_sitter_profile = Pet_sitter.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :address, :nickname, :email, :password,
                                 :password_confirmation)
  end
end

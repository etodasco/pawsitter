class PagesController < ApplicationController
  before_action :authenticate_user!, only: [ :home ]

  def home
     @users = User.all
  end

  def profile
    @user = User.find(params[:id])
    # animaux du user
    @pets = @user.pets

    # réservations pour Pet Owner
    @reservations_as_owner = @sent_reservations
    # réservations pour petsitter
    @reservations_as_petsitter = @received_reservation
  end

end

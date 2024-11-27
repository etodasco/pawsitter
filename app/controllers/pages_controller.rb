class PagesController < ApplicationController
  before_action :authenticate_user!, only: [ :home ]

  def home
     @users = User.all
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

  def pet_sitter_profile
    @pet_sitter_profile = User.find(params[:id])
    @reservations_as_petsitter = @pet_sitter_profile.received_reservations

  end

end

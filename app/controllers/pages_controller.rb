class PagesController < ApplicationController
  before_action :authenticate_user!, only: [ :home ]
  
  def home
    @pet_sitters = User.where(pet_sitter: true)
    # Geocode users for map markers
    @markers = @pet_sitters.geocoded.map do |pet_sitter|
      {
        lat: pet_sitter.latitude,
        lng: pet_sitter.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {pet_sitter: pet_sitter}),
        marker_html: render_to_string(partial: "marker")
      }
    end
    # user.pet_sitter
  end
end

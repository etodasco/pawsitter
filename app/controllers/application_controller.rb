class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def index
    # Geocode pets for map markers
    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {pet: pet}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end
  
end

class PagesController < ApplicationController
  before_action :authenticate_user!, only: [ :home ]

  def home
    # user.pet_sitter
  end
end

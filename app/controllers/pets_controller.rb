class PetsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]

  def new
    @pet = current_user.pets.new
  end

  def create
    @pet = current_user.pets.new(pet_params)
    if @pet.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end
end

private

def pet_params
  params.require(:pet).permit(:name, :species, :age, :description, :photo)
end

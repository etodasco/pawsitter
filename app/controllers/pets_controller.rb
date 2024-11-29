class PetsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]
  before_action :set_pet, only: [ :show, :edit, :update, :destroy ]

  def index
    @pets = Pet.all
  end

  def show
    @reservation = Reservation.new
  end

  def new
    @pet = current_user.pets.new
  end

  def create
    @pet = current_user.pets.new(pet_params)
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def edit
  end

  def update # Met à jour un profil d'animal
    @pet.update(pet_params)
    redirect_to pet_path(@pet), notice: "Profile was updated !"
  end

  def destroy
    @pet.destroy
    redirect_to pets_path
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

private

def pet_params
  params.require(:pet).permit(:name, :species, :description, :checklist)
end
end

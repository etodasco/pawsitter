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
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
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

  def pet_params
    params.require(:pet).permit(:name, :species, :breed, :age, :size, :description, :price, :photo)
  end
end

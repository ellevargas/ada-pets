class PetsController < ApplicationController
  def index
    pets = Pet.all
    render json: pets.as_json(only: [:name, :id, :age, :human])
  end

  def show
    pet = Pet.find_by(id: params[:id])
    # find throws an exception but find_by just redirects and has chill

    if pet
      render json: pet.as_json(only: [:name, :id, :age, :human]), :status => :ok
    else
      render :json => [], :status => :no_content
    end
  end

  def search
    pets = Pet.where(name: params[:query].capitalize)

    unless pets.empty?
      render json: pets.as_json(only: [:name, :id, :age, :human]), :status => :ok
    else
      render :json => [], :status => :no_content
    end
  end


end

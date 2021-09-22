class AnimalsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    inertia('Animals/Index', animals: Animal.all.map { |u| { id: u.id, name: u.name, kind: u.kind, gender: u.gender } })
  end

  def show
    animal = Animal.find(params[:id])

    inertia('Animals/Show', animal: animal)
  end

  def new
    inertia('Animals/New', genders: Animal.genders.keys)
    # inertia('Animals/Index', modal: 'Animals/NewModal', genders: Animal.genders.keys)
  end

  def create
    animal = Animal.create(animal_params)

    if animal.persisted?
      redirect_to animals_path, status: :see_other
    else
      redirect_to new_animal_path, inertia: { errors: animal.errors }
    end
  end

  def destroy
    Animal.find(params[:id]).destroy

    redirect_to animals_path, status: :see_other
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :kind, :age, :gender)
  end
end

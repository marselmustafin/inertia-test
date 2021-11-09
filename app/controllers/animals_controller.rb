class AnimalsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    scope =
      if params[:animal_class].in?(Animal.animal_classes.keys)
        Animal.where(animal_class: params[:animal_class])
      else
        Animal.all
      end

    render inertia: 'Animals/Index',
           props: {
             animals: scope.map { |a| a.attributes.slice('id', 'name', 'kind', 'animal_class') },
             all_count: -> { Animal.count },
             mammals_count: -> { Animal.mammal.count },
             birds_count: -> { Animal.bird.count },
             fish_count: -> { Animal.fish.count }
           }
  end

  def show
    animal = Animal.find(params[:id])

    render inertia: 'Animals/Show', props: { animal: animal }
  end

  def new
    render inertia: 'Animals/New', props: { animal_classes: Animal.animal_classes.keys }
  end

  def create
    animal = Animal.create(animal_params)

    if animal.persisted?
      redirect_to animals_path, status: :see_other
    else
      redirect_to new_animal_path, turbolinks: false, inertia: { errors: animal.errors }
    end
  end

  def destroy
    Animal.find(params[:id]).destroy

    redirect_to animals_path, status: :see_other
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :kind, :age, :animal_class, :photo)
  end
end

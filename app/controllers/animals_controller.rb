class AnimalsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    scope =
      if params[:gender].in?(Animal.genders.keys)
        Animal.where(gender: params[:gender])
      else
        Animal.all
      end

    render inertia: 'Animals/Index',
           props: {
             animals: scope.map { |a| a.attributes.slice('id', 'name', 'kind', 'gender') },
             all_count: -> { Animal.count },
             boys_count: -> { Animal.boy.count },
             girls_count: -> { Animal.girl.count },
             nb_count: -> { Animal.nb.count }
           }
  end

  def show
    animal = Animal.find(params[:id])

    render inertia: 'Animals/Show', props: { animal: animal }
  end

  def new
    render inertia: 'Animals/New', props: { genders: Animal.genders.keys }
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
    params.require(:animal).permit(:name, :kind, :age, :gender, :photo)
  end
end

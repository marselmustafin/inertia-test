class ReplaceGenderWithAnimalClass < ActiveRecord::Migration[6.1]
  def change
    remove_column :animals, :gender, :string
    add_column :animals, :animal_class, :string
  end
end

class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :kind

      t.timestamps
    end
  end
end

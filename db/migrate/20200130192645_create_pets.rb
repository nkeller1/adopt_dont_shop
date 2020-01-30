class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :image
      t.string :name
      t.integer :age
      t.string :sex
      t.string :shelter_name

      t.timestamp
    end
  end
end

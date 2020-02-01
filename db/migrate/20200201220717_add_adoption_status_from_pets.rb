class AddAdoptionStatusFromPets < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :adoption_status, :string, default: "open"
  end
end

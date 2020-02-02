class AddStatusToPets < ActiveRecord::Migration[5.1]
  def change
    remove_column :pets, :adoption_status, :string, default: "open"
    add_column :pets, :adoption_status, :string, default: "open"
  end
end

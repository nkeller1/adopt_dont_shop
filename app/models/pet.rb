class Pet < ApplicationRecord
  validates_presence_of :image, :name, :age, :sex, :shelter_name
end

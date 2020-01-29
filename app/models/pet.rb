class Pet < ApplicationRecord
  validates_presence_of :image, :name, :approximate_age, :sex
  belongs_to :shelter
end
class Measurement < ApplicationRecord
  belongs_to :item
  validates_presence_of :quantity, :unit  
  # accepts_nested_attributes_for :item # Singular becuase a measurement belongs to an item
end

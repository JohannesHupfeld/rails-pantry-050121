class Measurement < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates_presence_of :quantity, :unit  
  # accepts_nested_attributes_for :item # Singular becuase a measurement belongs to an item

  scope(:quantity_search, ->(quantity) {quantity == "" ? self.all : self.where("quantity = ?", quantity)})
  # scope method is a better option than a class method (project requirment)
  # .where is an active record query method

  # def self.quantity_search(quantity) #Class method 
  #   quantity == "" ? self.all : self.where("quantity = ?", quantity)
  # end
end

# Class methods or Scope methods are basically helper methods  

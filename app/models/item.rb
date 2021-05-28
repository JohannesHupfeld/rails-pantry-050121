class Item < ApplicationRecord
  #METHOD 1 (line 3)
  validates :name, presence: true, uniqueness: true # Pro of this way is ability to speciy multiple attributes at once (presence, uniqueness etc)
  validate :is_title_case
  before_validation :make_title_case # trying to change your data before you save it  
  has_many :measurements 
  has_many :users, through: :measurements

  accepts_nested_attributes_for :measurements # Since an item has many measurements we make it plural # OK when we dont have a has_many

  # def measurements_attributes=(attrs) # Necessary to define yourself when we have a has_many  
  #   attrs.values.each do |hash|
  #     self.measurements.build(hash)
  #   end
  # end                                 # Same as the macro above but doesnt work when we start using has_many relationships 

  def is_title_case
    if self.name != self.name.titlecase
      self.errors.add(:name, "must be titlecase")
    end
  end

  def make_title_case 
    self.name = self.name.titlecase  
  end
end  
  #---------------------------------------------------------------------------------------------------------
  #METHOD 2
  # validates_presence_of :name     # Pro of this way is you can validate multiple attributes at once (name, quantity, etc )
  # validates_uniqueness_of :name

  #---------------------------------------------------------------------------------------------------------
  #METHOD 3
  # validates :name, presence: true, name: true # corresponds to models/concerns/name_validator.rb

  #---------------------------------------------------------------------------------------------------------
  #METHOD 4
  # validate :custom_presence_validator

  # def custom_presence_validator   # This is the same as validates_presence_of :name just with our own custom error message. Typically you would not do this for presence becuase it already exists.
  #   if self.name.nil? || self.name.empty?
  #     self.errors.add(:name, "can't be blank")
  #   end
  # end

# Either way works 
 
# def initialize   ----------> THIS IS WHAT IS HAPPENING EVERYTIME WE INSTANIATE AN OBJECT
#   hash.each do |k,v|
#     self.send("#{k}=", v)
#   end
# end
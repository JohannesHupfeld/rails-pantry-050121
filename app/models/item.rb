class Item < ApplicationRecord
  # Either way works 

  validates :name, presence: true, uniqueness: true # Pro of this way is ability to speciy multiple attributes at once (presence, uniqueness etc)
  validate :is_title_case
  # validates_presence_of :name     # Pro of this way is you can validate multiple attributes at once (name, quantity, etc )
  # validates_uniqueness_of :name
  
  # validates :name, presence: true, name: true # corresponds to models/concerns/name_validator.rb
  
  # validate :custom_presence_validator

  # def custom_presence_validator   # This is the same as validates_presence_of :name just with our own custom error message. Typically you would not do this for presence becuase it already exists.
  #   if self.name.nil? || self.name.empty?
  #     self.errors.add(:name, "can't be blank")
  #   end
  # end
 
  before_validation :make_title_case

  def is_title_case
    if self.name != self.name.titlecase
      self.errors.add(:name, "must be titlecase")
    end
  end

  def make_title_case
    self.name = self.name.titlecase  
  end
end  

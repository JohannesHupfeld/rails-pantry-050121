class Item < ApplicationRecord

  # validates :name, presence: true, uniqueness: true # Pro of this way is ability to speciy multiple attributes at once (presence, uniqueness etc)
  
  validates_presence_of :name     # Pro of this way is you can validate multiple attributes at once (name, quantity, etc )
  validates_uniqueness_of :name

  # Either way works 
end  

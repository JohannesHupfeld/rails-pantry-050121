class User < ApplicationRecord
  has_many :measurements
  has_many :items, through: :measurements
end

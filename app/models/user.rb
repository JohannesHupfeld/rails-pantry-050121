class User < ApplicationRecord
  has_many :measurements
  has_many :items, through: :measurements
  has_secure_password

  validates_uniqueness_of :username
  validates_presence_of :username
end

class User < ActiveRecord::Base
  has_many :meals
  has_many :workouts
  # has many :
  has_secure_password
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
end
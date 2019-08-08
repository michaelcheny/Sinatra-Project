class User < ActiveRecord::Base
  has_many :meals
  has_many :workouts
  # has many :
  has_secure_password
  validates :name, length: { minimum: 2 }, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, length: { in: 6..20 }
end
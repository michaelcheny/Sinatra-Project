class User < ActiveRecord::Base
  has_many :meals
  has_many :workouts
  # has many :
  has_secure_password

  ## validation for account creation
  validates :name, length: { minimum: 2 }, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password_confirmation, presence: true, on: :create
  validates :password, presence: true, length: { in: 6..20 }, confirmation: true, unless: ->(u){ u.password.blank? }
end
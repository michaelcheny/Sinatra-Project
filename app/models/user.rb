class User < ActiveRecord::Base
  has_many :meals
  has_secure_password

  ## validation for account creation
  validates :username, presence: true, uniqueness: true, length: { minimum: 2}, format: { with: /\A[a-zA-Z0-9_-]+\z/, message: "cannot contain blank spaces or symbols" }
  validates :password_confirmation, presence: true, on: :create
  validates :password, presence: true, length: { in: 6..20 }, confirmation: true, unless: ->(u){ u.password.blank? }

  ## validation for user information
  validates :age, presence: true, numericality: { only_integer: true}, unless: ->(u){ u.age.blank? }
  validates :height, presence: true, numericality: { only_integer: true}, unless: ->(u){ u.height.blank? }
  validates :weight, presence: true, numericality: { only_integer: true}, unless: ->(u){ u.weight.blank? }
  
end
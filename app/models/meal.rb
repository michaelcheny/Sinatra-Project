class Meal < ActiveRecord::Base
  belongs_to :user

  validates :name, format: { with: /\A[a-zA-Z0-9_ -]+\z/, message: "cannot contain symbols" }
  validates :calories, numericality: { only_integer: true }
end
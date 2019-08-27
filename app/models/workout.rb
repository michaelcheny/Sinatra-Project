class Workout < ActiveRecord::Base
  belongs_to :user

  validates :name, format: { with: /\A[a-zA-Z0-9_ -]+\z/, message: "cannot contain symbols" }
  validates :duration, numericality: { only_integer: true }
  # validates :notes, format: { with: /\A[a-zA-Z0-9_ -]+\z/, message: "cannot contain symbols" }

end
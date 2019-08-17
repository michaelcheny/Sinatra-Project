class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.string :gender
      t.integer :age
      t.integer :height
      t.integer :weight
      t.string :activity_level
      t.string :goal
      t.integer :bmr
      t.integer :tdee
      t.timestamps
    end
  end
end

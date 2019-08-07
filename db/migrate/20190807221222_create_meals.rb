class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :name
      t.integer :serving_size
      t.integer :calories
      t.timestamps
    end
  end
end

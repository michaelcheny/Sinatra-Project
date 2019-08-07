class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.integer :age
      t.integer :height
      t.integer :weight

      t.timestamp
    end
  end
end

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :login
      t.text :password
      t.string :name
      t.string :surname
      t.integer :role_id

      t.timestamps
    end
  end
end
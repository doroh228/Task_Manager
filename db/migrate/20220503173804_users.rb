class Users < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :login, index: { unique: true }
      t.text :password, null: false
      t.string :name, null: false
      t.string :surname, null: false
      t.integer :role_id, null: false, :default => 2

      t.timestamps
    end
  end
end

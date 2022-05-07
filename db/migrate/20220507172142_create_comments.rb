class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.text :body, null: false
      t.integer :task_id

      t.timestamps
    end
  end
end

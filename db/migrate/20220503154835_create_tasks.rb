class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title,null: false
      t.text :body, null: false
      t.integer :reporter_id, null: false
      t.integer :assignee_id, null: false
      t.date :date_die
      t.integer :priority_id, null: false

      t.timestamps
    end
  end
end

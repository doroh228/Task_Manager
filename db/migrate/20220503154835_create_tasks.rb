class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :body
      t.integer :reporter_id
      t.integer :assignee_id
      t.date :date_die
      t.integer :priority_id

      t.timestamps
    end
  end
end

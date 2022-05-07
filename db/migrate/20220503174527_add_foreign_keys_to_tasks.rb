class AddForeignKeysToTasks < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :tasks, :users, column: :reporter_id, primary_key: :id
    add_foreign_key :tasks, :users, column: :assignee_id, primary_key: :id
    add_foreign_key :tasks, :priorities, column: :priority_id, primary_key: :id
  end
end

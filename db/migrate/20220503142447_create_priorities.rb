class CreatePriorities < ActiveRecord::Migration[7.0]
  def change
    create_table :priorities do |t|
      t.text :title
      t.timestamps
    end

    Priority.create(:title => 'Low')
    Priority.create(:title => 'Medium')
    Priority.create(:title => 'High')
  end
end

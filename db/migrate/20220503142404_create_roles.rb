class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.text :title
      t.timestamps
    end

    Role.create(:title => 'user')
    Role.create(:title => 'admin')
  end
end

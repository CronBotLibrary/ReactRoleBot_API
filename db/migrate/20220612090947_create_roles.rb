class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.integer :panel
      t.string :role
      t.string :emoji

      t.timestamps
    end
  end
end

class CreateDicts < ActiveRecord::Migration[7.0]
  def change
    create_table :dicts do |t|
      t.string :key
      t.string :value
      t.string :server_id
      t.boolean :is_regex

      t.timestamps
    end
  end
end

class CreatePanels < ActiveRecord::Migration[7.0]
  def change
    create_table :panels do |t|
      t.string :guild
      t.string :name
      t.string :channel
      t.string :message

      t.timestamps
    end
  end
end

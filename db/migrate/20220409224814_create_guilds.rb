class CreateGuilds < ActiveRecord::Migration[7.0]
  def change
    create_table :guilds do |t|
      t.string :name
      t.boolean :tts_blocked

      t.timestamps
    end
  end
end

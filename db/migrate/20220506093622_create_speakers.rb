class CreateSpeakers < ActiveRecord::Migration[7.0]
  def change
    create_table :speakers do |t|
      t.string :server_id
      t.string :engine
      t.string :value

      t.timestamps
    end
  end
end

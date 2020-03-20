class CreateCheckins < ActiveRecord::Migration[6.0]
  def change
    create_table :checkins do |t|
      t.integer :habit_id

      t.timestamps
    end
  end
end

class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.references :floor, index: true, foreign_key: true
      t.string :room_number

      t.timestamps null: false
    end
  end
end

class CreateFloors < ActiveRecord::Migration
  def change
    create_table :floors do |t|
      t.references :house, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end

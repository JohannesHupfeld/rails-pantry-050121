class CreateMeasurements < ActiveRecord::Migration[6.1]
  def change
    create_table :measurements do |t|
      t.string :unit
      t.integer :quantity
      t.integer :item_id

      t.timestamps
    end
  end
end

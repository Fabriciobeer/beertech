class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item
      t.integer :barcode
      t.integer :id_cervejaria

      t.timestamps null: false
    end
  end
end

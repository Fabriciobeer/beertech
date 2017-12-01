class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :item
      t.string :barcode
      t.integer :cliente_id

      t.timestamps null: false
    end
  end
end

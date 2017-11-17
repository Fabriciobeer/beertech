class CreateEstoquefinals < ActiveRecord::Migration
  def change
    create_table :estoquefinals do |t|
      t.integer :item_id
      t.integer :cliente_id
      t.integer :quantidade_atual
      t.string :destino

      t.timestamps null: false
    end
  end
end

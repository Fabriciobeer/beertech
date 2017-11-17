class CreateEstoquefinals < ActiveRecord::Migration
  def change
    create_table :estoquefinals do |t|
      t.integer :id_item
      t.integer :id_cervejaria
      t.integer :quantidade_atual
      t.string :destino

      t.timestamps null: false
    end
  end
end

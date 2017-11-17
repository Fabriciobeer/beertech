class CreateEstoquemps < ActiveRecord::Migration
  def change
    create_table :estoquemps do |t|
      t.integer :id_cervejaria
      t.string :item
      t.integer :quantidade_atual
      t.string :destino

      t.timestamps null: false
    end
  end
end

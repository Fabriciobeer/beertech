class CreateMateriaprimas < ActiveRecord::Migration
  def change
    create_table :materiaprimas do |t|
      t.integer :cliente_id
      t.string :item
      t.string :unidades
      t.integer :tamanho_pacote

      t.timestamps null: false
    end
  end
end

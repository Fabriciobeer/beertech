class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nome_cervejaria
      t.string :CNPJ
      t.string :estoque_mp
      t.string :estoque_final
      t.string :ciclo_vida_barril

      t.timestamps null: false
    end
  end
end

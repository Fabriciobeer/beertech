class CreateReceita < ActiveRecord::Migration
  def change
    create_table :receita do |t|
      t.integer :cliente_id
      t.string :nome_receita
      t.text :itens_receita, array: true, default: []
      t.text :quantidade_usada, array: true, default: []
      t.text :unidade_receita, array: true, default: []

      t.timestamps null: false
    end
  end
end

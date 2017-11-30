class CreateReceita < ActiveRecord::Migration
  def change
    create_table :receita do |t|
      t.integer :cliente_id
      t.string :nome_receita
      t.string :itens_receita
      t.string :quantidade_usada
      t.string :unidade_receita

      t.timestamps null: false
    end
  end
end

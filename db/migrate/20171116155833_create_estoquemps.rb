class CreateEstoquemps < ActiveRecord::Migration
  def change
    create_table :estoquemps do |t|
      t.integer :cliente_id
      t.string :item
      t.integer :quantidade_atual
      t.string :fornecedor
      t.string :atualizar

      t.timestamps null: false
    end
  end
end

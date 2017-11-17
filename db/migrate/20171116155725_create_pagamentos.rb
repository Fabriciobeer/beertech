class CreatePagamentos < ActiveRecord::Migration
  def change
    create_table :pagamentos do |t|
      t.integer :cliente_id
      t.integer :total_pagar
      t.string :pagamento_realizado
      t.datetime :data_proximo_pagamento

      t.timestamps null: false
    end
  end
end

class AddQuantidadeEntradaAndQuantidadeSaidaToEstoquefinals < ActiveRecord::Migration
  def change
    add_column :estoquefinals, :quantidade_entrada, :integer
    add_column :estoquefinals, :quantidade_saida, :integer
  end
end

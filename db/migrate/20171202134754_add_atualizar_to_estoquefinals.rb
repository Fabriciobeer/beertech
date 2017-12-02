class AddAtualizarToEstoquefinals < ActiveRecord::Migration
  def change
    add_column :estoquefinals, :atualizar, :string
  end
end

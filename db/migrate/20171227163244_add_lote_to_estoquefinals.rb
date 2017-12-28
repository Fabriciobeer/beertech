class AddLoteToEstoquefinals < ActiveRecord::Migration
  def change
    add_column :estoquefinals, :lote, :string
  end
end

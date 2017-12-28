class AddTamanhoBarrilToItems < ActiveRecord::Migration
  def change
    add_column :items, :tamanho_barril, :string
  end
end

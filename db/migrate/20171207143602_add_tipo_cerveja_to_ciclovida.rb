class AddTipoCervejaToCiclovida < ActiveRecord::Migration
  def change
    add_column :ciclovidas, :tipo_cerveja, :string
  end
end

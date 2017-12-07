class ChangeDataTypeForLocalizacaoInCiclovidas < ActiveRecord::Migration
  def change
    change_column :ciclovidas, :localizacao, :string
  end
end

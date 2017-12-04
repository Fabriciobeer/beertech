class AddTempoMaximoGuardadoToEstoquefinals < ActiveRecord::Migration
  def change
    add_column :estoquefinals, :tempo_maximo_guardado, :integer
  end
end

class CreateCiclovidas < ActiveRecord::Migration
  def change
    create_table :ciclovidas do |t|
      t.integer :id_cervejaria
      t.integer :id_item
      t.integer :localizacao

      t.timestamps null: false
    end
  end
end

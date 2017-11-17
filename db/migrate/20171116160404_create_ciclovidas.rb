class CreateCiclovidas < ActiveRecord::Migration
  def change
    create_table :ciclovidas do |t|
      t.integer :cliente_id
      t.integer :item_id
      t.integer :localizacao

      t.timestamps null: false
    end
  end
end

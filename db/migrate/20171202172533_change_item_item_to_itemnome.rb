class ChangeItemItemToItemnome < ActiveRecord::Migration
  def change
    rename_column :items, :item, :item_name
  end
end

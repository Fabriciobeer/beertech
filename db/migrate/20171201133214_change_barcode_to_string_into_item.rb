class ChangeBarcodeToStringIntoItem < ActiveRecord::Migration
  def change
    change_column :items, :barcode, :string
  end
end

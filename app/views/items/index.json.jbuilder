json.array!(@items) do |item|
  json.extract! item, :id, :item, :barcode, :id_cervejaria
  json.url item_url(item, format: :json)
end

json.array!(@estoquefinals) do |estoquefinal|
  json.extract! estoquefinal, :id, :id_item, :id_cervejaria, :quantidade_atual, :destino
  json.url estoquefinal_url(estoquefinal, format: :json)
end

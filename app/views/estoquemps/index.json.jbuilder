json.array!(@estoquemps) do |estoquemp|
  json.extract! estoquemp, :id, :id_cervejaria, :item, :quantidade_atual, :destino
  json.url estoquemp_url(estoquemp, format: :json)
end

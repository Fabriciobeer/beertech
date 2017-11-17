json.array!(@ciclovidas) do |ciclovida|
  json.extract! ciclovida, :id, :id_cervejaria, :id_item, :localizacao
  json.url ciclovida_url(ciclovida, format: :json)
end

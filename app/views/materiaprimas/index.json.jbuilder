json.array!(@materiaprimas) do |materiaprima|
  json.extract! materiaprima, :id, :cliente_id, :item, :unidades, :tamanho_pacote
  json.url materiaprima_url(materiaprima, format: :json)
end

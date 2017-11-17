json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :nome_cervejaria, :CNPJ, :estoque_mp, :estoque_final, :ciclo_vida_barril
  json.url cliente_url(cliente, format: :json)
end

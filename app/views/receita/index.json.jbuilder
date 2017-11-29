json.array!(@receita) do |receitum|
  json.extract! receitum, :id, :cliente_id, :nome_receita, :itens_receita[], :quantidade_usada[], :unidade_receita[]
  json.url receitum_url(receitum, format: :json)
end

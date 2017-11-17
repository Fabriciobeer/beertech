json.array!(@pagamentos) do |pagamento|
  json.extract! pagamento, :id, :id_cervejaria, :total_pagar, :pagamento_realizado, :data_proximo_pagamento
  json.url pagamento_url(pagamento, format: :json)
end

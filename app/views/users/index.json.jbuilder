json.array!(@users) do |user|
  json.extract! user, :id, :nome, :sobrenome, :email, :password_digest, :username, :nivel_usuario, :cliente_id
  json.url user_url(user, format: :json)
end

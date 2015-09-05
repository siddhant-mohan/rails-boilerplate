json.array!(@secret_codes) do |secret_code|
  json.extract! secret_code, :id, :code, :user_id
  json.url secret_code_url(secret_code, format: :json)
end

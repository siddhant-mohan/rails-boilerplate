json.array!(@permissions) do |permission|
  json.extract! permission, :id, :title, :action, :subject
  json.url permission_url(permission, format: :json)
end

json.extract! entrada, :id, :nombre, :unidad, :precio, :cantidad, :created_at, :updated_at
json.url entrada_url(entrada, format: :json)

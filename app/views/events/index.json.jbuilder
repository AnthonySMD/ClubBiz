json.array!(@events) do |event|
  json.extract! event, :id, :contents
  json.url event_url(event, format: :json)
end

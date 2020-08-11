json.array! @parties do |party|
  json.extract! party, :name, :location, :guests
end
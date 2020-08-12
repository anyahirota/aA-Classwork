@pokemon.each do |pokes|
    json.set! pokes.id do 
        json.extract! pokes, :id, :name
        json.image_url asset_path("pokemon_snaps/#{pokes.image_url}")
    end
end 

# @items.each do |item|
#     json.set! item.id do 
#         json.extract! item, :id, :name, :price, :happiness, :pokemon_id
#         json.image_url asset_path("#{item.image_url}")
#     end
# end 


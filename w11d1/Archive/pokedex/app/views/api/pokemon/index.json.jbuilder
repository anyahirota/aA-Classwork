@pokemon.each do |pokes|
    json.set! pokes.id do 
        json.extract! pokes, :id, :name
        json.image_url asset_path("pokemon_snaps/#{pokes.image_url}")
    end
end 
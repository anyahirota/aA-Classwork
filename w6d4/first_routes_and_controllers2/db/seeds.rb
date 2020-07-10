# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: 'last_airbender1')
User.create(username: 'waterbending_lover95')
User.create(username: 'flyingbison_yipyip')
User.create(username: 'fan_and_sword_guy')

Artwork.create(title: 'Fanart', image_url: 'www.ilikeswords.com', artist_id: 4 )
Artwork.create(title: 'Moon Spirit', image_url: 'www.oceangirl.com', artist_id: 2 )
Artwork.create(title: 'I am a Bison', image_url: 'www.mybisonartwork.com', artist_id: 3 )
Artwork.create(title: 'My Cabbages!!', image_url: 'www.savemycabbages.com', artist_id: 1 )
Artwork.create(title: 'The gunk in my toes', image_url: 'www.mybisonartwork.com', artist_id: 3)

ArtworkShare.create(artwork_id:2, viewer_id:1)
ArtworkShare.create(artwork_id:3, viewer_id:2)
ArtworkShare.create(artwork_id:5, viewer_id:3)

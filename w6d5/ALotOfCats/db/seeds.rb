# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all 
Cat.create(name: 'John', sex: 'M', birth_date: '1965/01/20', color: 'orange', description: 'I love boxes.') 
Cat.create(name: 'Paws', sex: 'F', birth_date: '2015/01/12', color: 'black', description: 'Hooooman')
Cat.create(name: "Larry", sex: "M", birth_date:'2019/12/20', color: "white", description: "Coding Champ") 
Cat.create(name: 'Tiger', sex: 'F', birth_date: '2020/01/22', color: 'yellow', description: 'Just living my life.')
Cat.create(name: 'Mitch', sex: 'M', birth_date: '2000/05/20', color: "brown" , description: "Little lion")
Cat.create(name: 'Garry', sex: 'M', birth_date: '2008/08/18', color: 'multicolor', description: 'I am not a cat.')
Cat.create(name: 'Chelsea', sex: 'F', birth_date: '2019/01/10', color: "white", description: "I always land on my feet")


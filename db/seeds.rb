# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Part.create!(name: '112926', description: 'Diagonal for stender UBK 100/200', weight: 2.0, system: 'peri', category: 'diagonal', multipack: 1, image: 'image')
Part.create!(name: '115354', description: 'Diagonal for stender UBK 125/100', weight: 3.0, system: 'peri', category: 'diagonal', multipack: 1, image: 'image')
Part.create!(name: '112765', description: 'Diagonal for stender UBK 125/200', weight: 3.4, system: 'peri', category: 'diagonal', multipack: 1, image: 'image')
Part.create!(name: '100981', description: 'Diagonal for stender UBK 150/100', weight: 3.8, system: 'peri', category: 'diagonal', multipack: 1, image: 'image')
Part.create!(name: '100973', description: 'Diagonal for stender UBK 150/150', weight: 3.0, system: 'peri', category: 'diagonal', multipack: 1, image: 'image')
Part.create!(name: '100572', description: 'Diagonal for stender UBK 150/200', weight: 4.0, system: 'peri', category: 'diagonal', multipack: 1, image: 'image')
Part.create!(name: '100985', description: 'Diagonal for stender UBK 200/100', weight: 5.0, system: 'peri', category: 'diagonal', multipack: 1, image: 'image')

Part.create!(name: '104029', description: 'Stalplank UDI 25x50', weight: 5.0, system: 'peri', category: 'stalplank', multipack: 1, image: 'image')
Part.create!(name: '104028', description: 'Stalplank UDI 25x75', weight: 5.0, system: 'peri', category: 'stalplank', multipack: 1, image: 'image')
Part.create!(name: '104027', description: 'Stalplank UDI 25x100', weight: 5.0, system: 'peri', category: 'stalplank', multipack: 1, image: 'image')

Site.create!(name: 'Oslo')
Site.create!(name: 'Oslo-centrum')
Site.create!(name: 'Bergen')


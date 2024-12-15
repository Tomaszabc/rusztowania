# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

System.create(name: 'peri')
System.create(name: 'alfix')
System.create(name: 'combisafe')
System.create(name: 'haki')
System.create(name: 'rullestias')
System.create(name: 'other')

Category.create(name: 'stenders')
Category.create(name: 'horisontals')
Category.create(name: 'planks')
Category.create(name: 'diagonals')
Category.create(name: 'rekkverks')
Category.create(name: 'fotlists')
Category.create(name: 'consolers')
Category.create(name: 'utv trapp')
Category.create(name: 'akcesoria')
Category.create(name: 'barelle')
Category.create(name: 'veggfester')
Category.create(name: 'RØR')

Site.create!(name: 'AGV 1 (Arnljot Gellines vei 1)', address: 'Arnljot Gellines vei 1')
Site.create!(name: 'Drammen Sykehus', address: 'Terminalen, 3012 Drammen, Norge')
Site.create!(name: 'Dronning Mauds gate 15 (DMG15)', address: 'Dronning Mauds gate 15')
Site.create!(name: 'Kolbotnveien 45', address: 'Kolbotnveien 45, 1410 Kolbotn')
Site.create!(name: 'Langhusbadet', address: 'Langhus')
Site.create!(name: 'Oljekaia', address: 'Kongshavnveien 20, 0193 Oslo')
Site.create!(name: 'Plaza Radisson Blu Hotel', address: 'Sonja Henies plass 3')
Site.create!(name: 'Polygon (forsikrings arbeide)', address: 'Oslo')
Site.create!(name: 'Professor Kohts vei 77 – 87.', address: 'Professor Kohts vei 77 – 87.')
Site.create!(name: 'RAD Radiumhospitalet', address: 'Ullernchausseen 70, 0379 Oslo')
Site.create!(name: 'Rikshospitalet varme', address: 'Sognsvannsveien 20, 0372 Oslo')
Site.create!(name: 'Sentrum scene', address: 'Arbeidersamfunnets plass 1, 0181 Oslo')
Site.create!(name: 'Steinbrøttet 18, 2022 Gjerdrum', address: 'Steinbrøttet 18, 2022 Gjerdrum')
Site.create!(name: 'Strømmen Storsenter', address: 'Støperiveien 5, 2010 Strømmen')
Site.create!(name: 'Søly Park', address: 'Syrinveien 5, 1516 Moss')
Site.create!(name: 'Tribunen', address: 'Ryggeveien 33, 1523 Moss')
Site.create!(name: 'Tøyenbadet', address: 'Helgesens gate 90, 0563 Oslo')
Site.create!(name: 'Vikingstidsmuseet', address: 'Huk Aveny 35, 0287 Oslo')
Site.create!(name: 'Udefinert', address: 'Write address in info')

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

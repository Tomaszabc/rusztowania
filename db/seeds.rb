# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
begin
  ActiveRecord::Base.transaction do

Part.create!(name: '100057', description: 'DIAGONAL EASY UBL 150/200', weight: 6.38, system: 'peri', category: 'diagonals', multipack: 1 )
Part.create!(name: '100061', description: 'DIAGONAL EASY UBL 200/200', weight: 7.15, system: 'peri', category: 'diagonals', multipack: 1 )
Part.create!(name: '100065', description: 'DIAGONAL EASY UBL 250/200', weight: 8.05, system: 'peri', category: 'diagonals', multipack: 1 )
Part.create!(name: '100069', description: 'DIAGONAL EASY UBL 300/200', weight: 9.04, system: 'peri', category: 'diagonals', multipack: 1 )
Part.create!(name: '100572', description: 'DIAG. F/STENDER UBK-2 150/200', weight: 7.59, system: 'peri', category: 'diagonals', multipack: 1 )
Part.create!(name: '133445', description: 'DIAG. F/STENDER UBK-2 200/200', weight: 6.10, system: 'peri', category: 'diagonals', multipack: 1 )
Part.create!(name: '133454', description: 'DIAG. F/STENDER UBK-2 250/200', weight: 6.76, system: 'peri', category: 'diagonals', multipack: 1 )
Part.create!(name: '133463', description: 'DIAG. F/STENDER UBK-2 300/200', weight: 7.44, system: 'peri', category: 'diagonals', multipack: 1 )
Part.create!(name: '130180', description: 'DIAGONAL EASY EBF 250/200', weight: 6.57, system: 'peri', category: 'diagonals', multipack: 1 )
Part.create!(name: '130189', description: 'DIAGONAL EASY EBF 300/200', weight: 7.46, system: 'peri', category: 'diagonals', multipack: 1 )



Part.create!(name: 'UL500', description: 'UNDERLAG 0,5 m', weight: 3.00, system: 'peri', category: 'stenders', multipack: 1 )
Part.create!(name: '100411', description: 'BUNNSKRUE UJB 38-50/30', weight: 3.39, system: 'peri', category: 'stenders', multipack: 1 )
Part.create!(name: '100183', description: 'LØFTESIKRING UJS', weight: 0.1, system: 'peri', category: 'stenders', multipack: 1 )
Part.create!(name: '133499', description: 'BASISSTENDER UVB 25', weight: 2.26, system: 'peri', category: 'stenders', multipack: 1 )
Part.create!(name: '135187', description: 'BASISSTENDER UVB 50', weight: 3.58, system: 'peri', category: 'stenders', multipack: 1 )
Part.create!(name: '132219', description: 'STENDER UVR-2 50', weight: 2.49, system: 'peri', category: 'stenders', multipack: 1 )
Part.create!(name: '132224', description: 'STENDER UVR-2 100', weight: 4.34, system: 'peri', category: 'stenders', multipack: 1 )
Part.create!(name: '132229', description: 'STENDER UVR-2 150', weight: 6.19, system: 'peri', category: 'stenders', multipack: 1 )
Part.create!(name: '132234', description: 'STENDER UVR-2 200', weight: 8.03, system: 'peri', category: 'stenders', multipack: 1 )
Part.create!(name: '132239', description: 'STENDER UVR-2 300', weight: 11.70, system: 'peri', category: 'stenders', multipack: 1 )
Part.create!(name: '137514', description: 'BASE STANDARS EVOTOP EVS 124', weight: 6.50, system: 'peri', category: 'stenders', multipack: 1 )
Part.create!(name: '137509', description: 'STANDARD EVOTOP EVM 200', weight: 8.50, system: 'peri', category: 'stenders', multipack: 1 )
Part.create!(name: '137517', description: 'TOP STANDARD EVOTOP EVT 96', weight: 3.73, system: 'peri', category: 'stenders', multipack: 1 )
Part.create!(name: '130512', description: 'REKKVERKSTOLPE EVP', weight: 3.88, system: 'peri', category: 'stenders', multipack: 1 )

Part.create!(name: '130450', description: 'STÅLPLANK EDS 33X67', weight: 5.42, system: 'peri', category: 'planks', multipack: 48 )
Part.create!(name: '130448', description: 'STÅLPLANK EDS 33X100', weight: 7.36, system: 'peri', category: 'planks', multipack: 48 )
Part.create!(name: '130445', description: 'STÅLPLANK EDS 33X150', weight: 10.30, system: 'peri', category: 'planks', multipack: 48 )
Part.create!(name: '130441', description: 'STÅLPLANK EDS 33X200 ', weight: 13.30, system: 'peri', category: 'planks', multipack: 48 )
Part.create!(name: '130438', description: 'STÅLPLANK EDS 33X250', weight: 16.20, system: 'peri', category: 'planks', multipack: 48 )
Part.create!(name: '129272', description: 'STÅLPLANK EDS 33X300', weight: 19.20, system: 'peri', category: 'planks', multipack: 48 )
Part.create!(name: '132479', description: 'STÅLPLANK UDG-2 25X50', weight: 3.19, system: 'peri', category: 'planks', multipack: 48 )
Part.create!(name: '132483', description: 'STÅLPLANK UDG-2 25X67', weight: 3.96, system: 'peri', category: 'planks', multipack: 48 )
Part.create!(name: '132492', description: 'STÅLPLANK UDG-2 25X100', weight: 5.45, system: 'peri', category: 'planks', multipack: 48 )
Part.create!(name: '132502', description: 'STÅLPLANK UDG-2 25X125', weight: 6.59, system: 'peri', category: 'planks', multipack: 48 )
Part.create!(name: '132505', description: 'STÅLPLANK UDG-2 25X150', weight: 7.73, system: 'peri', category: 'planks', multipack: 48 )
Part.create!(name: '132508', description: 'STÅLPLANK UDG-2 25X200', weight: 10.50, system: 'peri', category: 'planks', multipack: 48 )
Part.create!(name: '132511', description: 'STÅLPLANK UDG-2 25X250', weight: 12.90, system: 'peri', category: 'planks', multipack: 48 )
Part.create!(name: '132515', description: 'STÅLPLANK UDG-2 25X300', weight: 15.80, system: 'peri', category: 'planks', multipack: 48 )
Part.create!(name: '133285', description: 'STIGEPLATTFORM EAW-2 67X300-L', weight: 27.30, system: 'peri', category: 'planks', multipack: 48 )
Part.create!(name: '134549', description: 'HJØRNEPLATE EDP 25', weight: 2.80, system: 'peri', category: 'planks', multipack: 48 )
Part.create!(name: '134552', description: 'HJØRNEPLATE EDP 33', weight: 4.94, system: 'peri', category: 'planks', multipack: 48 )
Part.create!(name: '134539', description: 'ILEGGSPLATE EDL 33 ', weight: 6.27, system: 'peri', category: 'planks', multipack: 48 )




Part.create!(name: '131995', description: 'HORISONTAL UH-2 25', weight: 1.40, system: 'peri', category: 'horisontals', multipack: 1 )
Part.create!(name: '133900', description: 'HORISONTAL UH-2 33', weight: 1.59, system: 'peri', category: 'horisontals', multipack: 1 )
Part.create!(name: '131998', description: 'HORISONTAL UH-2 50', weight: 2.03, system: 'peri', category: 'horisontals', multipack: 1 )
Part.create!(name: '133903', description: 'HORISONTAL UH-2 67', weight: 2.47, system: 'peri', category: 'horisontals', multipack: 1 )
Part.create!(name: '132213', description: 'HORISONTAL UH-2 75', weight: 2.68, system: 'peri', category: 'horisontals', multipack: 1 )
Part.create!(name: '137911', description: 'HORISONTAL EVOTOP UH-2 100', weight: 3.75, system: 'peri', category: 'horisontals', multipack: 1 )
Part.create!(name: '132007', description: 'HORISONTAL UH-2 125', weight: 4.50, system: 'peri', category: 'horisontals', multipack: 1 )
Part.create!(name: '132010', description: 'HORISONTAL UH-2 150', weight: 4.67, system: 'peri', category: 'horisontals', multipack: 1 )
Part.create!(name: '132013', description: 'HORISONTAL UH-2 175', weight: 5.33, system: 'peri', category: 'horisontals', multipack: 1 )
Part.create!(name: '132016', description: 'HORISONTAL UH-2 200', weight: 5.99, system: 'peri', category: 'horisontals', multipack: 1 )
Part.create!(name: '132025', description: 'HORISONTAL UH-2 250', weight: 7.31, system: 'peri', category: 'horisontals', multipack: 1 )
Part.create!(name: '132022', description: 'HORISONTAL UH-2 300', weight: 8.64, system: 'peri', category: 'horisontals', multipack: 1 )
Part.create!(name: '137020', description: 'HORISONTAL FORSTERKT UHV-2 150', weight: 9.41, system: 'peri', category: 'horisontals', multipack: 1 )
Part.create!(name: '137025', description: 'HORISONTAL FORSTERKT UHV-2 200', weight: 12.70, system: 'peri', category: 'horisontals', multipack: 1 )
Part.create!(name: '137030', description: 'HORISONTAL FORSTERKT UHV-2 250', weight: 15.20, system: 'peri', category: 'horisontals', multipack: 1 )
Part.create!(name: '137035', description: 'HORISONTAL FORSTERKT UHV-2 300', weight: 18.50, system: 'peri', category: 'horisontals', multipack: 1 )
Part.create!(name: '131368', description: 'MULTIDRAGER ELM', weight: 26.40, system: 'peri', category: 'horisontals', multipack: 1 )

Part.create!(name: '130191', description: 'REKKVERK EASY EPG 67', weight: 1.15, system: 'peri', category: 'rekkverks', multipack: 1 )
Part.create!(name: '130193', description: 'REKKVERK EASY EPG 100', weight: 1.68, system: 'peri', category: 'rekkverks', multipack: 1 )
Part.create!(name: '130195', description: 'REKKVERK EASY EPG 150', weight: 2.48, system: 'peri', category: 'rekkverks', multipack: 1 )
Part.create!(name: '130197', description: 'REKKVERK EASY EPG 200', weight: 3.28, system: 'peri', category: 'rekkverks', multipack: 1 )
Part.create!(name: '130199', description: 'REKKVERK EASY EPG 250', weight: 4.09, system: 'peri', category: 'rekkverks', multipack: 1 )
Part.create!(name: '130201', description: 'REKKVERK EASY EPG 300', weight: 4.89, system: 'peri', category: 'rekkverks', multipack: 1 )
Part.create!(name: '130233', description: 'ENDEREKKVERK EASY EPF 33', weight: 4.48, system: 'peri', category: 'rekkverks', multipack: 1 )
Part.create!(name: '130228', description: 'ENDEREKKVERK EASY EPF 67', weight: 3.63, system: 'peri', category: 'rekkverks', multipack: 1 )
Part.create!(name: '130592', description: 'ENDEREKKVERK EASY EPF 75', weight: 3.88, system: 'peri', category: 'rekkverks', multipack: 1 )
Part.create!(name: '130225', description: 'ENDEREKKVERK EASY EPF 100', weight: 4.66, system: 'peri', category: 'rekkverks', multipack: 1 )
Part.create!(name: '130434', description: 'REKKVERKSKOBLING EASY EPR', weight: 1.10, system: 'peri', category: 'rekkverks', multipack: 1 )

Part.create!(name: '110213', description: 'FOTLIST STÅL UPY 50', weight: 0.93, system: 'peri', category: 'fotlists', multipack: 1 )
Part.create!(name: '129947', description: 'FOTLIST STÅL UPY 67', weight: 1.28, system: 'peri', category: 'fotlists', multipack: 1 )
Part.create!(name: '110514', description: 'FOTLIST STÅL UPY 75', weight: 1.45, system: 'peri', category: 'fotlists', multipack: 1 )
Part.create!(name: '134628', description: 'FOTLIST STÅL UPY 125', weight: 2.48, system: 'peri', category: 'fotlists', multipack: 1 )
Part.create!(name: '134637', description: 'FOTLIST STÅL UPY 150-C', weight: 2.99, system: 'peri', category: 'fotlists', multipack: 1 )
Part.create!(name: '134636', description: 'FOTLIST STÅL UPY 200-C', weight: 4.03, system: 'peri', category: 'fotlists', multipack: 1 )
Part.create!(name: '134635', description: 'FOTLIST STÅL UPY 250-C', weight: 5.06, system: 'peri', category: 'fotlists', multipack: 1 )
Part.create!(name: '134634', description: 'FOTLIST STÅL UPY 300-C', weight: 6.09, system: 'peri', category: 'fotlists', multipack: 1 )
Part.create!(name: '134542', description: 'FOTLISTSKJØT UPY-L', weight: 0.61, system: 'peri', category: 'fotlists', multipack: 1 )

Part.create!(name: '115959', description: 'CONSOLERS UC 25', weight: 1.16, system: 'peri', category: 'consolers', multipack: 1)
Part.create!(name: '130390', description: 'CONSOLERS UC 33', weight: 1.36, system: 'peri', category: 'consolers', multipack: 1)
Part.create!(name: '136050', description: 'DECK SUPPORT UCS 33', weight: 1.88, system: 'peri', category: 'consolers', multipack: 1)
Part.create!(name: '130378', description: 'CONSOLERS ECM 33', weight: 4.68, system: 'peri', category: 'consolers', multipack: 1)
Part.create!(name: '136923', description: 'CONSOLERS ECM 50', weight: 5.91, system: 'peri', category: 'consolers', multipack: 1)
Part.create!(name: '110483', description: 'CONSOLERS UCM 50-2', weight: 4.48, system: 'peri', category: 'consolers', multipack: 1)

Part.create!(name: '134561', description: 'TRAPP UAS-2 75x300/200', weight: 33.30, system: 'peri', category: 'UTV TRAPP', multipack: 1)
Part.create!(name: '124558', description: 'TRAPPREKKVERK EAG 300/200', weight: 8.18, system: 'peri', category: 'UTV TRAPP', multipack: 1)
Part.create!(name: '133705', description: 'LÅSEPINNE EAG', weight: 0.55, system: 'peri', category: 'UTV TRAPP', multipack: 1)
Part.create!(name: '100742', description: 'TRAPPREKKVERK UAG', weight: 10.00, system: 'peri', category: 'UTV TRAPP', multipack: 1)
Part.create!(name: '133543', description: 'INV. TRAPPEREKKVERK UAH-2', weight: 4.51, system: 'peri', category: 'UTV TRAPP', multipack: 1)

Part.create!(name: '130684', description: 'HORISONTALF. HALV UHA-2 M/TAP', weight: 2.02, system: 'peri', category: 'akcesoria', multipack: 1)
Part.create!(name: '110793', description: 'FLEKS.HORISONTALFESTE HALV UHA', weight: 1.09, system: 'peri', category: 'akcesoria', multipack: 1)
Part.create!(name: '136582', description: 'FLEKS.HOR.FESTE UHA-2', weight: 0.83, system: 'peri', category: 'akcesoria', multipack: 1)
Part.create!(name: '116306', description: 'LØS KLEMMROSETTE UEV180', weight: 1.70, system: 'peri', category: 'akcesoria', multipack: 1)
Part.create!(name: '17020', description: 'NORMALKOBLING NK 48/48', weight: 1.12, system: 'peri', category: 'akcesoria', multipack: 1)
Part.create!(name: '17010', description: 'VRIDBAR KOBLING DK 48/48, VERZ', weight: 1.40, system: 'peri', category: 'akcesoria', multipack: 1)

Part.create!(name: '103434', description: 'STØTTEBARELLE RP 80X120', weight: 38.50, system: 'peri', category: 'barelle', multipack: 1)
Part.create!(name: '103429', description: 'STØTTEBARELLE RP 80X150', weight: 45.30, system: 'peri', category: 'barelle', multipack: 1)
Part.create!(name: '065016', description: 'Gitterboks STOR', weight: 88.00, system: 'peri', category: 'barelle', multipack: 1)
Part.create!(name: '025670', description: 'Gitterboks SMÅ', weight: 67.00, system: 'peri', category: 'barelle', multipack: 1)
Part.create!(name: '103434?', description: 'Europall', weight: 20.00, system: 'peri', category: 'barelle', multipack: 1)


Site.create!(name: 'Oslo')
Site.create!(name: 'Oslo-centrum')
Site.create!(name: 'Bergen')

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

end
rescue ActiveRecord::RecordInvalid => e
  puts "Error occurred during database seeding: #{e.message}"
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
name1 = "Barbeque Nation"
address1 = "6-3-249/5/1, Ground Floor,ANR Centre, Road No. 1, Banjara Hills, Hyderabad"
tags1 = "European, North Indian, Mediterranean"
delivery1 = 45
imageURL = "https://s3.amazonaws.com/urad/westernRes.jpg"
detailsImageURL = "https://s3.amazonaws.com/urad/tacos.jpg"

name2 = "Nautanki Gali"
address2 = "Ohris Cyber Pearl, Cyber Pearl, Hitech City, Hyderabad   "
tags2 = "Continental, North Indian, Mughlai"
delivery2 = 60

name3 = "Cinnamon Fusion"
address3 = "3rd Floor, SBR Gateway, Hitech City, Madhapur Hyderabad"
tags3 = "European, Asian, North Indian"
delivery3 = 35

name4 = "Urban Asia - Kitchen & Bar"
address4 = "3rd Floor, 1259/A, Next to ICICI Bank, Road No.36, Jubilee Hills, Hyderabad  "
tags4 = "Chinese, Sea Food, Thai"
delivery4 = 30

name5 = "Paradise"
address5 = "Shilpa Kalavedika, Opposite Cyber Tower, Hitech City, Hyderabad"
tags5 = "Biryani, Chinese, North Indian, Sea Food"
delivery5 = 20


Restaurant.create!(:name => name1, :address => address1, :tags => tags1, :deliveryTime => delivery1, :imageURL => imageURL, :detailsImageURL => detailsImageURL)
Restaurant.create!(:name => name2, :address => address2, :tags => tags2, :deliveryTime => delivery2, :imageURL => imageURL, :detailsImageURL => detailsImageURL)
Restaurant.create!(:name => name3, :address => address3, :tags => tags3, :deliveryTime => delivery3, :imageURL => imageURL, :detailsImageURL => detailsImageURL)
Restaurant.create!(:name => name4, :address => address4, :tags => tags4, :deliveryTime => delivery4, :imageURL => imageURL, :detailsImageURL => detailsImageURL)
Restaurant.create!(:name => name5, :address => address5, :tags => tags5, :deliveryTime => delivery5, :imageURL => imageURL, :detailsImageURL => detailsImageURL)

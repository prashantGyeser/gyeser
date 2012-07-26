# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Restaurant seed
name1 = "Barbeque Nation"
address1 = "6-3-249/5/1, Ground Floor,ANR Centre, Road No. 1, Banjara Hills, Hyderabad"
tags1 = "European, North Indian, Mediterranean"
delivery1 = 45
imageURL = "https://s3.amazonaws.com/urad/westernRes.jpg"
detailsImageURL = "https://s3.amazonaws.com/urad/tacos.jpg"
email_id = "prashant@gyeser.com"
phone_number = "9840432883"

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


Restaurant.create!(:name => name1, :address => address1, :tags => tags1, :deliveryTime => delivery1, :imageURL => imageURL, :detailsImageURL => detailsImageURL, :email_id => email_id, :phone_number => phone_number)
Restaurant.create!(:name => name2, :address => address2, :tags => tags2, :deliveryTime => delivery2, :imageURL => imageURL, :detailsImageURL => detailsImageURL, :email_id => email_id, :phone_number => phone_number)
Restaurant.create!(:name => name3, :address => address3, :tags => tags3, :deliveryTime => delivery3, :imageURL => imageURL, :detailsImageURL => detailsImageURL, :email_id => email_id, :phone_number => phone_number)
Restaurant.create!(:name => name4, :address => address4, :tags => tags4, :deliveryTime => delivery4, :imageURL => imageURL, :detailsImageURL => detailsImageURL, :email_id => email_id, :phone_number => phone_number)
Restaurant.create!(:name => name5, :address => address5, :tags => tags5, :deliveryTime => delivery5, :imageURL => imageURL, :detailsImageURL => detailsImageURL, :email_id => email_id, :phone_number => phone_number)

# Menu seed
menuItemName1 = "Spinach Lasagna"
menuItemDesc1 = "Traditional layered pasta with ground Italian sausage, beef and Italian cheeses baked with house red sauce and topped with melted mozzarella cheese."
menuItemPrice1 = 500
menuItemRestId1 = 1
category1 = "Appetizer"

menuItemName2 = "Chopped Salad"
menuItemDesc2 = "Classic chopped salad with chipped greens,cucumber,blue cheese, walnuts with balsamic vinaigrette"
menuItemPrice2 = 150
menuItemRestId2 = 1
category2 = "Appetizer"

menuItemName3 = "Nachos"
menuItemDesc3 = "Blend of marinated chicken breast, diced tomatoes, garlic, onion, olive oil, Italian cherry peppers topped with melted mozzarella and fresh basil served over nacho chips and a side of Aflredo sauce"
menuItemPrice3 = 400
menuItemRestId3 = 1
category3 = "Main Course"

menuItemName4 = "Italian Sampler"
menuItemDesc4 = "A combination of toasted ravioli, fried mozzarella sticks and fried calamari served with our house red sauce"
menuItemPrice4 = 600
menuItemRestId4 = 1
category4 = "Appetizer"

MenuItem.create!(:name => menuItemName1, :description => menuItemDesc1, :category => category1, :price => menuItemPrice1, :restaurant_id => 1)
MenuItem.create!(:name => menuItemName2, :description => menuItemDesc2, :category => category2, :price => menuItemPrice2, :restaurant_id => 1)
MenuItem.create!(:name => menuItemName3, :description => menuItemDesc3, :category => category3, :price => menuItemPrice3, :restaurant_id => 1)
MenuItem.create!(:name => menuItemName4, :description => menuItemDesc4, :category => category4, :price => menuItemPrice4, :restaurant_id => 1)
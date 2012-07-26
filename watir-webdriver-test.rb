require 'watir-webdriver'


#############################################################################################################
# Adding colours to the output. Define green and red here
#############################################################################################################
def colorize(text, color_code)
  "\e[#{color_code}m#{text}\e[0m"
end

def red(text); colorize(text, 31); end
def green(text); colorize(text, 32); end
#############################################################################################################
# Home page test
#############################################################################################################
search_term = "Banjara Hills"
browser = Watir::Browser.new :chrome
browser.goto 'localhost:3000'

puts "Begining the home page search test"
#############################################################################################################
# Setting the window to full screen
#############################################################################################################
screen_width = browser.execute_script("return screen.width;")
screen_height = browser.execute_script("return screen.height;")
browser.driver.manage.window.resize_to(screen_width,screen_height)
browser.driver.manage.window.move_to(0,0)


browser.text_field(:id => 'search').set search_term
browser.button(:type => 'submit').click

if browser.url == "http://localhost:3000/restaurants?utf8=%E2%9C%93&search=Banjara+Hills"
	puts 'Home page search test -- Goes to the correct URL [ ' + green('SUCCESSFUL') + ' ]'
else
	puts 'Home page search test -- Goes to the correct URL [' + red('FAILED') + ']'
end

if browser.text.include? "No results found"
	puts 'Home page search test -- Search returns values [' + red('FAILED') + ']'
	abort "The restaurantlist page is not showing up so aborting..."
else
	puts 'Home page search test -- Search returns values [ ' + green('SUCCESSFUL') + ' ]'
end
#############################################################################################################
# Restaurant list test 
#############################################################################################################
browser.link(:href => "/restaurants/1").click

if browser.url == "http://localhost:3000/restaurants/1"
	puts 'Restaurant list page restaurant 1 click -- Goes to the correct URL [ ' + green('SUCCESSFUL') + ' ]'
else
	puts 'Restaurant list page restaurant 1 click -- Goes to the correct URL [' + red('FAILED') + ']'
	abort "Unaable to go to the individual restaurant page so aborting..."
end
#############################################################################################################
# Restaurant list test 
#############################################################################################################
browser.link(:id => "1").click
browser.link(:id => "2").click
browser.link(:id => "3").click
browser.text_field(:name => "1").set 2
browser.text_field(:name => "2").set 4
browser.link(:id => "checkout").click
#############################################################################################################
# Order page test 
#############################################################################################################
browser.text_field(:id => "order_name").when_present.set("Prashant")
browser.text_field(:id => "order_email").when_present.set("prashant@gyeser.com")
browser.text_field(:id => "order_address").when_present.set("156 Majestic Colony, Valasaravakkam, Chennai-600087")
puts "The browser url is:#{browser.url}"

if browser.url.include? "http://localhost:3000/orders/new?cart_id="
	puts 'Checkout click -- Contains the right URL [ ' + green('SUCCESSFUL') + ' ]'
else
	puts 'Checkout click -- Contains the right URL -- Goes to the correct URL [' + red('FAILED') + ']'
end
browser.button(:value, "Update Order").when_present.click
#############################################################################################################
# Thank you for the order page test 
#############################################################################################################
if browser.text.include? "Thank you for your order"
	puts 'Order success page -- Contains Thanks you for the order [ ' + green('SUCCESSFUL') + ' ]'
else
	puts 'Order success page -- Contains Thanks you for the order [' + red('FAILED') + ']'
	abort "The restaurantlist page is not showing up so aborting..."
end
#############################################################################################################
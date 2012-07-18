class NotificationMailer < ActionMailer::Base
	
	logger.debug "It is getting to the action mailer"

  def restaurant_order(restaurant, cart)
  	logger.debug "It is getting to the action mailer, email id = #{restaurant.email_id}"
  	@items_purchased = cart.line_items
  	mail(:to => restaurant.email_id, :subject => "Order", :from => "notifications@gyeser.com")
  end
end

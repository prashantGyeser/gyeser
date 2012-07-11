class ApplicationController < ActionController::Base
  protect_from_forgery
	private

	def current_cart
		logger.debug "Top, most in the list.The cart id is:"
		logger.debug params[:cart_id]
		# The JS on the page is sending the value as a string. Not sure why. That is why the value is being checked against a string i.e. '0'
		if params[:cart_id] == '0'
			logger.debug "It is getting into the if statement is:"
			logger.debug params[:cart_id]
			cart = Cart.create
			session[:cart_id] = cart.id
			cart
		else
			logger.debug "It is getting into the else statement is:"
			logger.debug params[:cart_id]
			Cart.find(params[:cart_id])
		end


		#Cart.find(session[:cart_id])
	rescue ActiveRecord::RecordNotFound

	end
end

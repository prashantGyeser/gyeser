class ApplicationController < ActionController::Base
  protect_from_forgery
	private

	def current_cart
		logger.debug "The cart id is:"
		logger.debug params[:cart_id]
		if params[:cart_id] == 0
			logger.debug "It is getting into the if statement is:"
			logger.debug params[:cart_id]
			Cart.find(params[:cart_id])
		else
			logger.debug "It is getting into the else statement is:"
			logger.debug params[:cart_id]
			cart = Cart.create
			session[:cart_id] = cart.id
			cart
		end


		#Cart.find(session[:cart_id])
	rescue ActiveRecord::RecordNotFound

	end
end

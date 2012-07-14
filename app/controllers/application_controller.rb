class ApplicationController < ActionController::Base
  protect_from_forgery
	private

	def current_cart
		logger.debug "Top, most in the list.The cart id is:"
		logger.debug params[:cart_id]
		#def current_cart
			#logger.debug "It is getting into the the find statement:"
			#Cart.find(session[:cart_id])
		#rescue ActiveRecord::RecordNotFound
			logger.debug "It is getting into the rescue statement :"
			cart = Cart.create
			#session[:cart_id] = cart.id
		logger.debug "TRhe newly created cart id is:#{cart.id}"
			cart
		#end

	end
end

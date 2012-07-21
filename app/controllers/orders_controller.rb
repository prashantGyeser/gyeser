class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  before_filter :authenticate_user!, :except => [:new]

  def index
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
		logger.debug "The value in the cart in the order controller is:#{params[:cart_id]}"
		Rails.logger.info("PARAMS: #{params.inspect}")
    logger.debug("The direct param value is:#{params}")
    logger.debug params
    @cart = Cart.find(params[:cart_id])
    logger.debug "Number of items in the cart=#{@cart.line_items.count}"
		if @cart.line_items.empty?
			# Todo: Right now this redirect just sends the user to the restaurant list. It does not redirect them based on the search term they entered. This needs to be fixed
			redirect_to restaurants_url, :notice => "Your cart is empty"
			logger.debug "Restaurant path:#{restaurant_url}"
			return false
		end
		cart = [params[:cart_id]]
		logger.debug "The cart id in the order controller is:#{cart}"
    @order = Order.new
    logger.debug "The order id after the order.new is: #{@order.id}"

    @order.cart_id = cart
    logger.debug "The order id after the order.new is: #{@order.cart_id}"    
    logger.debug "It gets to the new method"

    @order.save
    logger.debug "The order cart id is: #{@order.cart_id}"
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])
    logger.debug "It gets to the create method"
    logger.debug "The cart value in the order cretae method is :#{@cart}"

    respond_to do |format|
      if @order.save
        #notification_mailer.restaurant_order(restaurant)
        format.html { redirect_to @order, notice: 'Order was successfully placed.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])
    logger.debug "It gets to the update method and the cart id is:#{params[:cart_id]}"
    #@cart = Cart.find(params[:cart_id])
    #logger.debug "Cart in the update method: #{@cart.id}"

    respond_to do |format|
      if @order.update_attributes(params[:order])
        
        # Sending the orders to the restaurant email id
        cart = Cart.find(@order.cart_id)
        logger.debug "The order cart id is: #{@order.cart_id}"
        logger.debug "Cart in the update method from the order is: #{cart.id}"
        restaurant = cart.line_items.first.menu_item.restaurant
        NotificationMailer.restaurant_order(restaurant, cart).deliver

        # Sending SMS using Twilio
        #require 'twilio-ruby'
        #@account_sid = 'ACafe3308aad17f597910e9f6f8868e7af'
        #@auth_token = '933e2a551fa2642dd4401f817270016a'
        #@client = Twilio::REST::Client.new(@account_sid, @auth_token)
        #@client.account.sms.messages.create( :from => '+14155992671', :to => '+919840432883',:body => 'Hey there!')

        # Sending SMS using Nexmo
        #require 'nexmo'
        #nexmo =  Nexmo::Client.new('3e4821cd', '5120efaa')

        # Sending SMS using Exotel
        #require 'rubygems'
        #require 'typhoeus'
        #require 'json'

        # Exotel account settings
        #exotel_sid = 'gyeser'
        #exotel_token = '92e34f5ef963ac94ec61f4337ebe75a0019a237e'
        #URL = "https://#{exotel_sid}:#{exotel_token}@twilix.exotel.in/v1/Accounts/#{exotel_sid}/Sms/send"

        #post_data = {:From => "8808891988", :To => "#{restaurant.phone_number}", :Body => "Akki, the message will be some thing like this, everything after the colon: B1:2,B67:4. Gyeser -- Prashant"}
        #puts "The array is:#{post_data}"

        #response = Typhoeus::Request.post(URL,:params => post_data)


        # Trying using typheus
        # the request object
        #request = Typhoeus::Request.new(URL,
                        #:ssl_verifypeer => false,
         #               :disable_ssl_peer_verification => true,
          #                              #:body          => "this is a request body",
           #                             :method        => :post,
                                        #:headers       => {:Accept => "text/html"},
            #                            :verbose     => true, 
             #                           :timeout       => 100000, # milliseconds
              #                          :cache_timeout => 60, # seconds
               #                         :params        => post_data)
        #hydra = Typhoeus::Hydra.new
        #hydra.queue(request)
        #hydra.run





        # the response object will be set after the request is run
        #response = request.response

        

        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end

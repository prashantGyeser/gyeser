class LineItemsController < ApplicationController
  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @line_items }
    end
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/new
  # GET /line_items/new.json
  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @line_item }
    end
  end

  # GET /line_items/1/edit
  def edit
    @line_item = LineItem.find(params[:id])
  end

  # POST /line_items
  # POST /line_items.json
  def create
		@cart = current_cart
		@menu_items = []
		@failed = []

		if params[:menu_item_id].is_a?(Hash)
			@menu_item_id_hashes = params[:menu_item_id].values
		else
			@menu_item_id_hashes = params[:menu_item_id]
		end
		if params[:menu_item_quantity].is_a?(Hash)
			@menu_item_quantity_hashes = params[:menu_item_quantity].values
		else
			@menu_item_quantity_hashes = params[:menu_item_quantity]
		end

    logger.debug "The menu items are:#{@menu_item_id_hashes}"

		totalNumberOfItems = @menu_item_quantity_hashes.count
		for i in 0..(totalNumberOfItems-1)
			@line_item = LineItem.new()
			menu_item_id = @menu_item_id_hashes[i]
      logger.debug "The menu id before finding the item V2 is:#{menu_item_id[:menu_item_id]}" 
			menu_item = MenuItem.find(menu_item_id[:menu_item_id])
      logger.debug "The menu item is:#{menu_item}" 
			quantity = @menu_item_quantity_hashes[i]
			@line_item = @cart.line_items.build(menu_item_id: menu_item.id)
      logger.debug "The menu item id after line item created is:#{menu_item.id}" 
			@line_item.quantity = quantity
			@line_item.save
		end

    # Storing the total for the line items in the cart
    cart_total = 0
    @cart.line_items.each do |line_item|
      cart_total = cart_total + line_item.menu_item.price
    end
    logger.debug "Cart total:#{cart_total}"
    @cart.total = cart_total
    @cart.save
    logger.debug "Cart total = #{@cart.total}"

    respond_to do |format|
      if @line_item.save
				format.html { render text: @cart.id }
        # format.html { redirect_to @line_item.cart, notice: 'Line item was successfully created.' }
        format.json { render json: @line_item, status: :created, location: @line_item }
			else
				@failed << menu_item
        format.html { render action: "new" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /line_items/1
  # PUT /line_items/1.json
  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to line_items_url }
      format.json { head :no_content }
    end
  end
end

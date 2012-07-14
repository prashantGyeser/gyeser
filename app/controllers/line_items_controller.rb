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
		logger.debug "The param is:"
		Rails.logger.info("PARAMS: #{params.inspect}")
		@cart = current_cart
		logger.debug "The cart id is:"
		logger.debug @cart.id
		@menu_items = []
		@failed = []

		#Rails.logger.info("PARAMS: #{params.inspect}")

		if params[:menu_item_id].is_a?(Hash)
			@menu_item_id_hashes = params[:menu_item_id].values
		else
			@menu_item_id_hashes = params[:menu_item_id]
		end
		if params[:menu_item_quantity].is_a?(Hash)
			@menu_item_quantity_hashes = params[:menu_item_quantity].values
		else
			logger.debug "It is getting into the else statement for the quantity hash"
			@menu_item_quantity_hashes = params[:menu_item_quantity]
		end
		totalNumberOfItems = @menu_item_quantity_hashes.count
		for i in 0..(totalNumberOfItems-1)
			@line_item = LineItem.new()
			logger.debug "Item counter: #{i}"
			menu_item_id_hash = @menu_item_id_hashes[i]
			logger.debug "Menu Item Id Hashes in the loop: #{menu_item_id_hash}"
			logger.debug "Menu Item Id in loop before finding the menuitem: #{menu_item_id_hash[:menu_item_id]}"
			menu_item = MenuItem.find(menu_item_id_hash[:menu_item_id])
			quantity = @menu_item_quantity_hashes[i]
			logger.debug "Menu Item quantity in the loop: #{quantity}"
			logger.debug "Menu Item in the for loop: #{menu_item_id_hash[:menu_item_id]}"
			#@line_item = @cart.add_menu_item(menu_item,quantity)
			@line_item = @cart.line_items.build(menu_item_id: menu_item)
			logger.debug "Ok, I think it created the line item:#{@line_item}"
			@line_item.save
		end
		logger.debug "Total Items: #{totalNumberOfItems}"
		logger.debug "Menu Item Quantity Hashes: #{@menu_item_quantity_hashes}"
		logger.debug "Menu Item Id hashes Hashes: #{@menu_item_id_hashes}"

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

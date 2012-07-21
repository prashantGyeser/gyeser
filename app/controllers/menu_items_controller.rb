class MenuItemsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]
  
  # GET /menu_items
  # GET /menu_items.json
  def index
    @menu_items = MenuItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @menu_items }
    end
  end

  # GET /menu_items/1
  # GET /menu_items/1.json
  def show
    @menu_item = MenuItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @menu_item }
    end
  end

  # GET /menu_items/new
  # GET /menu_items/new.json
  def new
    @menu_item = MenuItem.new

    # Getting the restaurant name and id that this item will be assocaited with
    @restaurant_id = session[:restaurant_id]
    @restaurant_name = session[:restaurant_name]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @menu_item }
    end
  end

  # GET /menu_items/1/edit
  def edit
    @menu_item = MenuItem.find(params[:id])
  end

  # POST /menu_items
  # POST /menu_items.json
  def create
    @menu_item = MenuItem.new(params[:menu_item])

    respond_to do |format|
      if @menu_item.save
        # Storing the restaurant name and id in the session variable so that it does not need to be entered everytime when the model is created.
        session[:restaurant_id] = @menu_item.restaurant_id
        session[:restaurant_name] = @menu_item.restaurant.name

        format.html { redirect_to new_menu_item_path, notice: 'Menu item was successfully created.' }
        format.json { render json: @menu_item, status: :created, location: @menu_item }
      else
        format.html { render action: "new" }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /menu_items/1
  # PUT /menu_items/1.json
  def update
    @menu_item = MenuItem.find(params[:id])

    respond_to do |format|
      if @menu_item.update_attributes(params[:menu_item])
        format.html { redirect_to @menu_item, notice: 'Menu item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @menu_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_items/1
  # DELETE /menu_items/1.json
  def destroy
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy

    respond_to do |format|
      format.html { redirect_to menu_items_url }
      format.json { head :no_content }
    end
  end
end

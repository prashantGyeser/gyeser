class RestaurantsController < ApplicationController
  # GET /restaurants
  # GET /restaurants.json

  #before_filter :authenticate_user!, :except => [:index, :show]calc

  def index
    if params[:search].present?
      logger.debug "Search params is:#{params[:search]}"
      @restaurants = Restaurant.near(params[:search], 3, :order => :distance)
    else
      @restaurants = Restaurant.all  
    end
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @restaurants }
    end
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @restaurant = Restaurant.find(params[:id])
    @menu_items = MenuItem.where(:restaurant_id => (params[:id]))

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @restaurant }

    
    end
  end

  # GET /restaurants/new
  # GET /restaurants/new.json
  def new
    @restaurant = Restaurant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @restaurant }
    end
  end

  # GET /restaurants/1/edit
  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(params[:restaurant])

    respond_to do |format|
      if @restaurant.save
        # Storing the restaurant name and id in the session variable so that it does not need to be entered everytime when the model is created.
        session[:restaurant_id] = @restaurant.id
        session[:restaurant_name] = @restaurant.name
        format.html { redirect_to new_menu_item_path, notice: 'Restaurant was successfully created.' }
        format.json { render json: @restaurant, status: :created, location: @restaurant }
      else
        format.html { render action: "new" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /restaurants/1
  # PUT /restaurants/1.json
  def update
    @restaurant = Restaurant.find(params[:id])

    respond_to do |format|
      if @restaurant.update_attributes(params[:restaurant])
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1
  # DELETE /restaurants/1.json
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to restaurants_url }
      format.json { head :no_content }
    end
  end
end

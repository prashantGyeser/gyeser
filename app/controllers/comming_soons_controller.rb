class CommingSoonsController < ApplicationController
  # GET /comming_soons
  # GET /comming_soons.json
  def index
    @comming_soons = CommingSoon.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comming_soons }
    end
  end

  # GET /comming_soons/1
  # GET /comming_soons/1.json
  def show
    @comming_soon = CommingSoon.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comming_soon }
    end
  end

  # GET /comming_soons/new
  # GET /comming_soons/new.json
  def new
    @comming_soon = CommingSoon.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comming_soon }
    end
  end

  # GET /comming_soons/1/edit
  def edit
    @comming_soon = CommingSoon.find(params[:id])
  end

  # POST /comming_soons
  # POST /comming_soons.json
  def create
    @comming_soon = CommingSoon.new(params[:comming_soon])

    respond_to do |format|
      if @comming_soon.save
        format.html { redirect_to @comming_soon, notice: 'Comming soon was successfully created.' }
        format.json { render json: @comming_soon, status: :created, location: @comming_soon }
      else
        format.html { render action: "new" }
        format.json { render json: @comming_soon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comming_soons/1
  # PUT /comming_soons/1.json
  def update
    @comming_soon = CommingSoon.find(params[:id])

    respond_to do |format|
      if @comming_soon.update_attributes(params[:comming_soon])
        format.html { redirect_to @comming_soon, notice: 'Comming soon was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comming_soon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comming_soons/1
  # DELETE /comming_soons/1.json
  def destroy
    @comming_soon = CommingSoon.find(params[:id])
    @comming_soon.destroy

    respond_to do |format|
      format.html { redirect_to comming_soons_url }
      format.json { head :no_content }
    end
  end
end

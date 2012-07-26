require "spec_helper"

describe CommingSoonsController do
  describe "routing" do

    it "routes to #index" do
      get("/comming_soons").should route_to("comming_soons#index")
    end

    it "routes to #new" do
      get("/comming_soons/new").should route_to("comming_soons#new")
    end

    it "routes to #show" do
      get("/comming_soons/1").should route_to("comming_soons#show", :id => "1")
    end

    it "routes to #edit" do
      get("/comming_soons/1/edit").should route_to("comming_soons#edit", :id => "1")
    end

    it "routes to #create" do
      post("/comming_soons").should route_to("comming_soons#create")
    end

    it "routes to #update" do
      put("/comming_soons/1").should route_to("comming_soons#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/comming_soons/1").should route_to("comming_soons#destroy", :id => "1")
    end

  end
end

require "spec_helper"

describe ProvidedDatesController do
  describe "routing" do

    it "routes to #index" do
      get("/provided_dates").should route_to("provided_dates#index")
    end

    it "routes to #new" do
      get("/provided_dates/new").should route_to("provided_dates#new")
    end

    it "routes to #show" do
      get("/provided_dates/1").should route_to("provided_dates#show", :id => "1")
    end

    it "routes to #edit" do
      get("/provided_dates/1/edit").should route_to("provided_dates#edit", :id => "1")
    end

    it "routes to #create" do
      post("/provided_dates").should route_to("provided_dates#create")
    end

    it "routes to #update" do
      put("/provided_dates/1").should route_to("provided_dates#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/provided_dates/1").should route_to("provided_dates#destroy", :id => "1")
    end

  end
end

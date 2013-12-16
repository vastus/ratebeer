require "spec_helper"

describe BeersController do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/beers").to route_to("beers#index")
    end

    it "routes to #new" do
      expect(:get => "/beers/new").to route_to("beers#new")
    end

    it "routes to #show" do
      expect(:get => "/beers/1").to route_to("beers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/beers/1/edit").to route_to("beers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/beers").to route_to("beers#create")
    end

    it "routes to #update" do
      expect(:put => "/beers/1").to route_to("beers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/beers/1").to route_to("beers#destroy", :id => "1")
    end

  end
end

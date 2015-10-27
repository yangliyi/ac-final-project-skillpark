require "rails_helper"

RSpec.describe Admin::PicturesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/pictures").to route_to("admin/pictures#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/pictures/new").to route_to("admin/pictures#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/pictures/1").to route_to("admin/pictures#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/pictures/1/edit").to route_to("admin/pictures#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/pictures").to route_to("admin/pictures#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/pictures/1").to route_to("admin/pictures#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/pictures/1").to route_to("admin/pictures#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/pictures/1").to route_to("admin/pictures#destroy", :id => "1")
    end

  end
end

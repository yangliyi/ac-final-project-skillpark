require "rails_helper"

RSpec.describe Admin::ProfilesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/profiles").to route_to("admin/profiles#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/profiles/new").to route_to("admin/profiles#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/profiles/1").to route_to("admin/profiles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/profiles/1/edit").to route_to("admin/profiles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/profiles").to route_to("admin/profiles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/profiles/1").to route_to("admin/profiles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/profiles/1").to route_to("admin/profiles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/profiles/1").to route_to("admin/profiles#destroy", :id => "1")
    end

  end
end

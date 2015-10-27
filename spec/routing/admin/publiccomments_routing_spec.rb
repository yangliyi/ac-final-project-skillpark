require "rails_helper"

RSpec.describe Admin::PubliccommentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/publiccomments").to route_to("admin/publiccomments#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/publiccomments/new").to route_to("admin/publiccomments#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/publiccomments/1").to route_to("admin/publiccomments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/publiccomments/1/edit").to route_to("admin/publiccomments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/publiccomments").to route_to("admin/publiccomments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/publiccomments/1").to route_to("admin/publiccomments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/publiccomments/1").to route_to("admin/publiccomments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/publiccomments/1").to route_to("admin/publiccomments#destroy", :id => "1")
    end

  end
end

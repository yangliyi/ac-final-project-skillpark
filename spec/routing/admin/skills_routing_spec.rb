require "rails_helper"

RSpec.describe Admin::SkillsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/skills").to route_to("admin/skills#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/skills/new").to route_to("admin/skills#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/skills/1").to route_to("admin/skills#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/skills/1/edit").to route_to("admin/skills#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/skills").to route_to("admin/skills#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/skills/1").to route_to("admin/skills#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/skills/1").to route_to("admin/skills#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/skills/1").to route_to("admin/skills#destroy", :id => "1")
    end

  end
end

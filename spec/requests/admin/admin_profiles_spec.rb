require 'rails_helper'

RSpec.describe "Admin::Profiles", type: :request do
  describe "GET /admin_profiles" do
    it "works! (now write some real specs)" do
      get admin_profiles_path
      expect(response).to have_http_status(200)
    end
  end
end

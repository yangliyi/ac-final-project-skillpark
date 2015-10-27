require 'rails_helper'

RSpec.describe "Admin::Pictures", type: :request do
  describe "GET /admin_pictures" do
    it "works! (now write some real specs)" do
      get admin_pictures_path
      expect(response).to have_http_status(200)
    end
  end
end

require 'rails_helper'

RSpec.describe "Admin::Publiccomments", type: :request do
  describe "GET /admin_publiccomments" do
    it "works! (now write some real specs)" do
      get admin_publiccomments_path
      expect(response).to have_http_status(200)
    end
  end
end

require 'rails_helper'

RSpec.describe "Admin::Comments", type: :request do
  describe "GET /admin_comments" do
    it "works! (now write some real specs)" do
      get admin_comments_path
      expect(response).to have_http_status(200)
    end
  end
end

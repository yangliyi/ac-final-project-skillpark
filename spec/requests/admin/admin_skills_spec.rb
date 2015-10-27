require 'rails_helper'

RSpec.describe "Admin::Skills", type: :request do
  describe "GET /admin_skills" do
    it "works! (now write some real specs)" do
      get admin_skills_path
      expect(response).to have_http_status(200)
    end
  end
end

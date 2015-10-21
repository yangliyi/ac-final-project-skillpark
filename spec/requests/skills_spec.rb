require 'rails_helper'

RSpec.describe "Skills", type: :request do

  describe "GET /skills" do
    it "should get skills list" do
      s1 = Skill.create!(name: "foo", description: "abcdef")
      s2 = Skill.create!(name: "bar", description: "ghijkl")

      get "/api/v1/skills"

      expected_response_data = { "metadata" => { "total" => 2 },
        "data" => [
          { "id" => s1.id, "name" => s1.name, "requirement" => s1.requirement, "description" => s1.description, "category" => s1.categories.map{|c|c.id} },
          { "id" => s2.id, "name" => s2.name, "requirement" => s2.requirement, "description" => s2.description, "category" => s2.categories.map{|c|c.id} }
        ]
      }
      expect(response).to have_http_status(200)
      expect(response.body).to eq(expected_response_data.to_json)

    end
  end

end
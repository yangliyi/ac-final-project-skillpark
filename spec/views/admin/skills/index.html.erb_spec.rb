require 'rails_helper'

RSpec.describe "admin/skills/index", type: :view do
  before(:each) do
    assign(:admin_skills, [
      Admin::Skill.create!(),
      Admin::Skill.create!()
    ])
  end

  it "renders a list of admin/skills" do
    render
  end
end

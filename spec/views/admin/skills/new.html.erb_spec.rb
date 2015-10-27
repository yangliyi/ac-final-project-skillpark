require 'rails_helper'

RSpec.describe "admin/skills/new", type: :view do
  before(:each) do
    assign(:admin_skill, Admin::Skill.new())
  end

  it "renders new admin_skill form" do
    render

    assert_select "form[action=?][method=?]", admin_skills_path, "post" do
    end
  end
end

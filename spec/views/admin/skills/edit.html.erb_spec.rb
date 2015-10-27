require 'rails_helper'

RSpec.describe "admin/skills/edit", type: :view do
  before(:each) do
    @admin_skill = assign(:admin_skill, Admin::Skill.create!())
  end

  it "renders the edit admin_skill form" do
    render

    assert_select "form[action=?][method=?]", admin_skill_path(@admin_skill), "post" do
    end
  end
end

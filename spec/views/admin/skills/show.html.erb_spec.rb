require 'rails_helper'

RSpec.describe "admin/skills/show", type: :view do
  before(:each) do
    @admin_skill = assign(:admin_skill, Admin::Skill.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

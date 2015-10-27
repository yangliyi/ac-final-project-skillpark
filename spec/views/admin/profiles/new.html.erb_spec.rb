require 'rails_helper'

RSpec.describe "admin/profiles/new", type: :view do
  before(:each) do
    assign(:admin_profile, Admin::Profile.new())
  end

  it "renders new admin_profile form" do
    render

    assert_select "form[action=?][method=?]", admin_profiles_path, "post" do
    end
  end
end

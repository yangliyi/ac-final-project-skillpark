require 'rails_helper'

RSpec.describe "admin/profiles/edit", type: :view do
  before(:each) do
    @admin_profile = assign(:admin_profile, Admin::Profile.create!())
  end

  it "renders the edit admin_profile form" do
    render

    assert_select "form[action=?][method=?]", admin_profile_path(@admin_profile), "post" do
    end
  end
end

require 'rails_helper'

RSpec.describe "admin/profiles/show", type: :view do
  before(:each) do
    @admin_profile = assign(:admin_profile, Admin::Profile.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

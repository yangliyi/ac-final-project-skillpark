require 'rails_helper'

RSpec.describe "admin/locations/show", type: :view do
  before(:each) do
    @admin_location = assign(:admin_location, Admin::Location.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

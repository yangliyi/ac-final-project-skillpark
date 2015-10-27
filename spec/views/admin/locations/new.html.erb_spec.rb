require 'rails_helper'

RSpec.describe "admin/locations/new", type: :view do
  before(:each) do
    assign(:admin_location, Admin::Location.new())
  end

  it "renders new admin_location form" do
    render

    assert_select "form[action=?][method=?]", admin_locations_path, "post" do
    end
  end
end

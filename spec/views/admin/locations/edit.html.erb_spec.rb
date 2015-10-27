require 'rails_helper'

RSpec.describe "admin/locations/edit", type: :view do
  before(:each) do
    @admin_location = assign(:admin_location, Admin::Location.create!())
  end

  it "renders the edit admin_location form" do
    render

    assert_select "form[action=?][method=?]", admin_location_path(@admin_location), "post" do
    end
  end
end

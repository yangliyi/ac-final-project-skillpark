require 'rails_helper'

RSpec.describe "admin/locations/index", type: :view do
  before(:each) do
    assign(:admin_locations, [
      Admin::Location.create!(),
      Admin::Location.create!()
    ])
  end

  it "renders a list of admin/locations" do
    render
  end
end

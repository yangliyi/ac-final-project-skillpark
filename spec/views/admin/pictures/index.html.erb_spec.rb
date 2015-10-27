require 'rails_helper'

RSpec.describe "admin/pictures/index", type: :view do
  before(:each) do
    assign(:admin_pictures, [
      Admin::Picture.create!(),
      Admin::Picture.create!()
    ])
  end

  it "renders a list of admin/pictures" do
    render
  end
end

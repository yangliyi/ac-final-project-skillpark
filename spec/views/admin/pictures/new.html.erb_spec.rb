require 'rails_helper'

RSpec.describe "admin/pictures/new", type: :view do
  before(:each) do
    assign(:admin_picture, Admin::Picture.new())
  end

  it "renders new admin_picture form" do
    render

    assert_select "form[action=?][method=?]", admin_pictures_path, "post" do
    end
  end
end

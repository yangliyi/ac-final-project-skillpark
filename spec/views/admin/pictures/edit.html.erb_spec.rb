require 'rails_helper'

RSpec.describe "admin/pictures/edit", type: :view do
  before(:each) do
    @admin_picture = assign(:admin_picture, Admin::Picture.create!())
  end

  it "renders the edit admin_picture form" do
    render

    assert_select "form[action=?][method=?]", admin_picture_path(@admin_picture), "post" do
    end
  end
end

require 'rails_helper'

RSpec.describe "admin/pictures/show", type: :view do
  before(:each) do
    @admin_picture = assign(:admin_picture, Admin::Picture.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

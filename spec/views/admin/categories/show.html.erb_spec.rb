require 'rails_helper'

RSpec.describe "admin/categories/show", type: :view do
  before(:each) do
    @admin_category = assign(:admin_category, Admin::Category.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

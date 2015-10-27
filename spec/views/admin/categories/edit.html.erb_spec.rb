require 'rails_helper'

RSpec.describe "admin/categories/edit", type: :view do
  before(:each) do
    @admin_category = assign(:admin_category, Admin::Category.create!())
  end

  it "renders the edit admin_category form" do
    render

    assert_select "form[action=?][method=?]", admin_category_path(@admin_category), "post" do
    end
  end
end

require 'rails_helper'

RSpec.describe "admin/categories/index", type: :view do
  before(:each) do
    assign(:admin_categories, [
      Admin::Category.create!(),
      Admin::Category.create!()
    ])
  end

  it "renders a list of admin/categories" do
    render
  end
end

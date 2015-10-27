require 'rails_helper'

RSpec.describe "admin/publiccomments/new", type: :view do
  before(:each) do
    assign(:admin_publiccomment, Admin::Publiccomment.new())
  end

  it "renders new admin_publiccomment form" do
    render

    assert_select "form[action=?][method=?]", admin_publiccomments_path, "post" do
    end
  end
end

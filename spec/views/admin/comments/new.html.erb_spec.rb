require 'rails_helper'

RSpec.describe "admin/comments/new", type: :view do
  before(:each) do
    assign(:admin_comment, Admin::Comment.new())
  end

  it "renders new admin_comment form" do
    render

    assert_select "form[action=?][method=?]", admin_comments_path, "post" do
    end
  end
end

require 'rails_helper'

RSpec.describe "admin/comments/edit", type: :view do
  before(:each) do
    @admin_comment = assign(:admin_comment, Admin::Comment.create!())
  end

  it "renders the edit admin_comment form" do
    render

    assert_select "form[action=?][method=?]", admin_comment_path(@admin_comment), "post" do
    end
  end
end

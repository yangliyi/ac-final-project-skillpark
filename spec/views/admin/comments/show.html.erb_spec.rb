require 'rails_helper'

RSpec.describe "admin/comments/show", type: :view do
  before(:each) do
    @admin_comment = assign(:admin_comment, Admin::Comment.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

require 'rails_helper'

RSpec.describe "admin/comments/index", type: :view do
  before(:each) do
    assign(:admin_comments, [
      Admin::Comment.create!(),
      Admin::Comment.create!()
    ])
  end

  it "renders a list of admin/comments" do
    render
  end
end

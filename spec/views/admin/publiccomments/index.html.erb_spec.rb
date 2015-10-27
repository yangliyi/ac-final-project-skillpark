require 'rails_helper'

RSpec.describe "admin/publiccomments/index", type: :view do
  before(:each) do
    assign(:admin_publiccomments, [
      Admin::Publiccomment.create!(),
      Admin::Publiccomment.create!()
    ])
  end

  it "renders a list of admin/publiccomments" do
    render
  end
end

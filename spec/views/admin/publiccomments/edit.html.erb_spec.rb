require 'rails_helper'

RSpec.describe "admin/publiccomments/edit", type: :view do
  before(:each) do
    @admin_publiccomment = assign(:admin_publiccomment, Admin::Publiccomment.create!())
  end

  it "renders the edit admin_publiccomment form" do
    render

    assert_select "form[action=?][method=?]", admin_publiccomment_path(@admin_publiccomment), "post" do
    end
  end
end

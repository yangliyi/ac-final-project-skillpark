require 'rails_helper'

RSpec.describe "admin/publiccomments/show", type: :view do
  before(:each) do
    @admin_publiccomment = assign(:admin_publiccomment, Admin::Publiccomment.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

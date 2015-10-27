require 'rails_helper'

RSpec.describe "admin/profiles/index", type: :view do
  before(:each) do
    assign(:admin_profiles, [
      Admin::Profile.create!(),
      Admin::Profile.create!()
    ])
  end

  it "renders a list of admin/profiles" do
    render
  end
end

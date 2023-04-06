require 'rails_helper'

RSpec.describe "adminusers/show", type: :view do
  before(:each) do
    assign(:adminuser, Adminuser.create!(
      email: "Email",
      isaadmin: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/false/)
  end
end

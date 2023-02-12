require 'rails_helper'

RSpec.describe "alumnis/show", type: :view do
  before(:each) do
    assign(:alumni, Alumni.create!(
      ID: 2,
      first_name: "First Name",
      last_name: "Last Name",
      email: "Email",
      graduation_year: 3,
      company: "Company"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Company/)
  end
end

require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    assign(:user, User.create!(
      first_name: "First Name",
      last_name: "Last Name",
      email: "Email",
      password: "Password",
      role: "Role",
      uin: "Uin"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/Role/)
    expect(rendered).to match(/Uin/)
  end
end

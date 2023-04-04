require 'rails_helper'

RSpec.describe "adminusers/edit", type: :view do
  let(:adminuser) {
    Adminuser.create!(
      email: "MyString",
      isaadmin: false
    )
  }

  before(:each) do
    assign(:adminuser, adminuser)
  end

  it "renders the edit adminuser form" do
    render

    assert_select "form[action=?][method=?]", adminuser_path(adminuser), "post" do

      assert_select "input[name=?]", "adminuser[email]"

      assert_select "input[name=?]", "adminuser[isaadmin]"
    end
  end
end

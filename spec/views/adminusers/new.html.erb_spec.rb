require 'rails_helper'

RSpec.describe "adminusers/new", type: :view do
  before(:each) do
    assign(:adminuser, Adminuser.new(
      email: "MyString",
      isaadmin: false
    ))
  end

  it "renders new adminuser form" do
    render

    assert_select "form[action=?][method=?]", adminusers_path, "post" do

      assert_select "input[name=?]", "adminuser[email]"

      assert_select "input[name=?]", "adminuser[isaadmin]"
    end
  end
end

require 'rails_helper'

RSpec.describe "alumnis/edit", type: :view do
  let(:alumni) {
    Alumni.create!(
      ID: 1,
      first_name: "MyString",
      last_name: "MyString",
      email: "MyString",
      graduation_year: 1,
      company: "MyString"
    )
  }

  before(:each) do
    assign(:alumni, alumni)
  end

  it "renders the edit alumni form" do
    render

    assert_select "form[action=?][method=?]", alumni_path(alumni), "post" do

      assert_select "input[name=?]", "alumni[ID]"

      assert_select "input[name=?]", "alumni[first_name]"

      assert_select "input[name=?]", "alumni[last_name]"

      assert_select "input[name=?]", "alumni[email]"

      assert_select "input[name=?]", "alumni[graduation_year]"

      assert_select "input[name=?]", "alumni[company]"
    end
  end
end

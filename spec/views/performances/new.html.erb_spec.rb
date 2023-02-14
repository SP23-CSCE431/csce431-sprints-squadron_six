require 'rails_helper'

RSpec.describe "performances/new", type: :view do
  before(:each) do
    assign(:performance, Performance.new(
      user_id: "MyString",
      grade: "MyString",
      points: 1
    ))
  end

  it "renders new performance form" do
    render

    assert_select "form[action=?][method=?]", performances_path, "post" do

      assert_select "input[name=?]", "performance[user_id]"

      assert_select "input[name=?]", "performance[grade]"

      assert_select "input[name=?]", "performance[points]"
    end
  end
end

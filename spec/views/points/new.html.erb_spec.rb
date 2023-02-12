require 'rails_helper'

RSpec.describe "points/new", type: :view do
  before(:each) do
    assign(:point, Point.new(
      user_id: "MyString",
      total_points: 1
    ))
  end

  it "renders new point form" do
    render

    assert_select "form[action=?][method=?]", points_path, "post" do

      assert_select "input[name=?]", "point[user_id]"

      assert_select "input[name=?]", "point[total_points]"
    end
  end
end

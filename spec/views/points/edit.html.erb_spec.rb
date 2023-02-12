require 'rails_helper'

RSpec.describe "points/edit", type: :view do
  let(:point) {
    Point.create!(
      user_id: "MyString",
      total_points: 1
    )
  }

  before(:each) do
    assign(:point, point)
  end

  it "renders the edit point form" do
    render

    assert_select "form[action=?][method=?]", point_path(point), "post" do

      assert_select "input[name=?]", "point[user_id]"

      assert_select "input[name=?]", "point[total_points]"
    end
  end
end

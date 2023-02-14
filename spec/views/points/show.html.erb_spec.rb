require 'rails_helper'

RSpec.describe "points/show", type: :view do
  before(:each) do
    assign(:point, Point.create!(
      user_id: "User",
      total_points: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/User/)
    expect(rendered).to match(/2/)
  end
end

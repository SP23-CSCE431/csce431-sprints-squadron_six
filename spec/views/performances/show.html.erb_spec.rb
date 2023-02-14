require 'rails_helper'

RSpec.describe "performances/show", type: :view do
  before(:each) do
    assign(:performance, Performance.create!(
      user_id: "User",
      grade: "Grade",
      points: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/User/)
    expect(rendered).to match(/Grade/)
    expect(rendered).to match(/2/)
  end
end

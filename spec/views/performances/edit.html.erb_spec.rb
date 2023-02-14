require 'rails_helper'

RSpec.describe "performances/edit", type: :view do
  let(:performance) {
    Performance.create!(
      user_id: "MyString",
      grade: "MyString",
      points: 1
    )
  }

  before(:each) do
    assign(:performance, performance)
  end

  it "renders the edit performance form" do
    render

    assert_select "form[action=?][method=?]", performance_path(performance), "post" do

      assert_select "input[name=?]", "performance[user_id]"

      assert_select "input[name=?]", "performance[grade]"

      assert_select "input[name=?]", "performance[points]"
    end
  end
end

require 'rails_helper'

RSpec.describe "performances/index", type: :view do
  before(:each) do
    assign(:performances, [
      Performance.create!(
        user_id: "User",
        grade: "Grade",
        points: 2
      ),
      Performance.create!(
        user_id: "User",
        grade: "Grade",
        points: 2
      )
    ])
  end

  it "renders a list of performances" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("User".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Grade".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end

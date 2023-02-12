require 'rails_helper'

RSpec.describe "alumnis/index", type: :view do
  before(:each) do
    assign(:alumnis, [
      Alumni.create!(
        ID: 2,
        first_name: "First Name",
        last_name: "Last Name",
        email: "Email",
        graduation_year: 3,
        company: "Company"
      ),
      Alumni.create!(
        ID: 2,
        first_name: "First Name",
        last_name: "Last Name",
        email: "Email",
        graduation_year: 3,
        company: "Company"
      )
    ])
  end

  it "renders a list of alumnis" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Company".to_s), count: 2
  end
end

require 'rails_helper'

RSpec.describe "adminusers/index", type: :view do
  before(:each) do
    assign(:adminusers, [
      Adminuser.create!(
        email: "Email",
        isaadmin: false
      ),
      Adminuser.create!(
        email: "Email",
        isaadmin: false
      )
    ])
  end

  it "renders a list of adminusers" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end

require 'rails_helper'

RSpec.describe "performances/index", type: :view do
  before(:each) do
    assign(:performances, [
      Performance.create!(),
      Performance.create!()
    ])
  end

  it "renders a list of performances" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end

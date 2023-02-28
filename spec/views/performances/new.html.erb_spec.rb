require 'rails_helper'

RSpec.describe "performances/new", type: :view do
  before(:each) do
    assign(:performance, Performance.new())
  end

  it "renders new performance form" do
    render

    assert_select "form[action=?][method=?]", performances_path, "post" do
    end
  end
end

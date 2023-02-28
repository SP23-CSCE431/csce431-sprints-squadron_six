require 'rails_helper'

RSpec.describe "alumnis/new", type: :view do
  before(:each) do
    assign(:alumni, Alumni.new())
  end

  it "renders new alumni form" do
    render

    assert_select "form[action=?][method=?]", alumnis_path, "post" do
    end
  end
end

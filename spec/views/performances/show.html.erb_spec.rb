require 'rails_helper'

RSpec.describe "performances/show", type: :view do
  before(:each) do
    assign(:performance, Performance.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

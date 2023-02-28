require 'rails_helper'

RSpec.describe "performances/edit", type: :view do
  let(:performance) {
    Performance.create!()
  }

  before(:each) do
    assign(:performance, performance)
  end

  it "renders the edit performance form" do
    render

    assert_select "form[action=?][method=?]", performance_path(performance), "post" do
    end
  end
end

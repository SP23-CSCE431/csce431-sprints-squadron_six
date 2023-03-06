require 'rails_helper'

RSpec.describe "courses/edit", type: :view do
  let(:course) {
    Course.create(course_name: "CSCE431", course_hours: 3)
  }

  before(:each) do
    assign(:course, course)
  end

  it "renders the edit course form" do
    render

    assert_select "form[action=?][method=?]", course_path(course), "post" do
    end
  end
end

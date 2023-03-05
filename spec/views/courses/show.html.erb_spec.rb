require 'rails_helper'

RSpec.describe "courses/show", type: :view do
  before(:each) do
    assign(:course, Course.create(course_name: "CSCE431", course_hours: 3))
  end

  it "renders attributes in <p>" do
    render
  end
end

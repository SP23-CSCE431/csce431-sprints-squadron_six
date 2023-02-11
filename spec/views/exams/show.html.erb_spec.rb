require 'rails_helper'

RSpec.describe "exams/show", type: :view do
  before(:each) do
    assign(:exam, Exam.create!(
      user_id: "User"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/User/)
  end
end

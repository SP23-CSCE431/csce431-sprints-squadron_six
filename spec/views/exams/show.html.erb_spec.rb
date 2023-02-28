require 'rails_helper'

RSpec.describe "exams/show", type: :view do
  before(:each) do
    assign(:exam, Exam.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end

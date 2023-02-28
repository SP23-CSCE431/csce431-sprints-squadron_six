require 'rails_helper'

RSpec.describe "exams/edit", type: :view do
  let(:exam) {
    Exam.create!()
  }

  before(:each) do
    assign(:exam, exam)
  end

  it "renders the edit exam form" do
    render

    assert_select "form[action=?][method=?]", exam_path(exam), "post" do
    end
  end
end

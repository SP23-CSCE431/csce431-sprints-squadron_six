# integration tests for alumnis
require 'rails_helper'

RSpec.describe 'Creating an Alumni', type: :feature do
  # sunny day
  scenario 'valid inputs' do
    visit new_alumni_path
    fill_in "exam[exam_grade]", with: nil
    fill_in "exam[course_id]", with: Course.create(course_name:"CSCE 431", course_hours:3).id
    click_on 'Create Exam'
    visit exams_path
    expect(page).to have_content('successfully created')
  end

  # rainy days: no course, no date, or both
  
end
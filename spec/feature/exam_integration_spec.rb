# integration tests for exams
# location: spec/feature/exam_integration_spec.rb

require 'rails_helper'

RSpec.describe 'Creating an Exam', type: :feature do
  # sunny day
  scenario 'valid inputs' do
    Course.create(course_name:"CSCE_431", course_hours:3)
    visit new_exam_path
    fill_in "exam[exam_date]", with: Date.today + 1.week
    fill_in "exam[exam_grade]", with: 'A'
    select "CSCE_431", :from =>"exam[course_id]"
    click_on 'Create Exam'
    expect(page).to have_content('successfully created')
  end

  # rainy days: no course, no date, or both
  scenario 'invalid inputs: no course' do
    visit new_exam_path
    fill_in "exam[exam_date]", with: Date.today + 1.week
    fill_in "exam[exam_grade]", with: nil
    click_on 'Create Exam'
    expect(page).to have_content('2 errors prohibited')
  end

  scenario 'invalid inputs: no date' do
    visit new_exam_path
    fill_in "exam[exam_date]", with: nil
    fill_in "exam[course_id]", with: Course.create(course_name:"CSCE 431", course_hours:3).id
    click_on 'Create Exam'
    expect(page).to have_content('1 error prohibited')
  end

  scenario 'invalid inputs: no date or course' do
    visit new_exam_path
    fill_in "exam[exam_date]", with: nil
    fill_in "exam[course_id]", with: nil
    click_on 'Create Exam'
    expect(page).to have_content('3 errors prohibited')
  end
end

# RSpec.describe 'Updating an Exam', type: :feature do
#   # sunny day
#   scenario 'valid inputs' do
#     visit new_exam_path
#     fill_in "exam[course_id]", with: Course.create(course_name:"CSCE 431", course_hours:3).id
#     fill_in "exam[exam_date]", with: Date.today + 1.week
#     fill_in "exam[exam_grade]", with: nil
#     click_on 'Create Exam'
#     visit exams_path
#     click_on 'SHOW'
#     click_on 'Edit this exam'
#     fill_in "exam[exam_grade]", with: 'A'
#     click_on 'Update Exam'
#     expect(page).to have_content('A')
#   end
#
#   # rainy days: no course, no date, or both
#   scenario 'invalid inputs: no course' do
#     visit new_exam_path
#     fill_in "exam[course_id]", with: Course.create(course_name:"CSCE 431", course_hours:3).id
#     fill_in "exam[exam_date]", with: Date.today + 1.week
#     fill_in "exam[exam_grade]", with: nil
#     click_on 'Create Exam'
#     visit exams_path
#     click_on 'SHOW'
#     click_on 'Edit this exam'
#     fill_in "exam[course_id]", with: nil
#     click_on 'Update Exam'
#     expect(page).to have_content('2 errors prohibited')
#   end
#
#   scenario 'invalid inputs: no date' do
#     visit new_exam_path
#     fill_in "exam[course_id]", with: Course.create(course_name:"CSCE 431", course_hours:3).id
#     fill_in "exam[exam_date]", with: Date.today + 1.week
#     fill_in "exam[exam_grade]", with: nil
#     click_on 'Create Exam'
#     visit exams_path
#     click_on 'SHOW'
#     click_on 'Edit this exam'
#     fill_in "exam[exam_date]", with: nil
#     click_on 'Update Exam'
#     expect(page).to have_content('1 error prohibited')
#   end
#
#   scenario 'invalid inputs: no date or course' do
#     visit new_exam_path
#     fill_in "exam[course_id]", with: Course.create(course_name:"CSCE 431", course_hours:3).id
#     fill_in "exam[exam_date]", with: Date.today + 1.week
#     fill_in "exam[exam_grade]", with: nil
#     click_on 'Create Exam'
#     visit exams_path
#     click_on 'SHOW'
#     click_on 'Edit this exam'
#     fill_in "exam[exam_date]", with: nil
#     fill_in "exam[course_id]", with: nil
#     click_on 'Update Exam'
#     expect(page).to have_content('3 errors prohibited')
#   end
# end
#
# RSpec.describe 'Deleting an Exam', type: :feature do
#   scenario 'valid inputs' do
#     visit new_exam_path
#     fill_in "exam[course_id]", with: Course.create(course_name:"CSCE 431", course_hours:3).id
#     fill_in "exam[exam_date]", with: Date.today + 1.week
#     fill_in "exam[exam_grade]", with: nil
#     click_on 'Create Exam'
#     visit exams_path
#     click_on 'SHOW'
#     click_on 'Destroy this exam'
#     expect(page).to have_content('Exam was successfully destroyed.')
#   end

  # exam deletion does not cause errors/there's not a wrong way to do it
# end

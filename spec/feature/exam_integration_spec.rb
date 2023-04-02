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
  # can't select no course anymore, so no testing for that case

  scenario 'invalid inputs: no date' do
    Course.create(course_name:"CSCE_431", course_hours:3)
    visit new_exam_path
    fill_in "exam[exam_date]", with: nil
    select "CSCE_431", :from =>"exam[course_id]"
    click_on 'Create Exam'
    expect(page).to have_content('1 error prohibited')
  end

end

RSpec.describe 'Updating an Exam', type: :feature do
  # sunny day
  scenario 'valid inputs' do
    Course.create(course_name:"CSCE_431", course_hours:3)
    visit new_exam_path
    select "CSCE_431", :from =>"exam[course_id]"
    fill_in "exam[exam_date]", with: Date.today + 1.week
    fill_in "exam[exam_grade]", with: nil
    click_on 'Create Exam'
    visit exams_path
    click_on 'SHOW'
    click_on 'EDIT'
    fill_in "exam[exam_grade]", with: 'A'
    click_on 'Update Exam'
    expect(page).to have_content('A')
  end

  # rainy days: no course, no date, or both

  # can't select the null option for course, so no course isn't a test

  scenario 'invalid inputs: no date' do
    Course.create(course_name:"CSCE_431", course_hours:3)
    visit new_exam_path
    select "CSCE_431", :from =>"exam[course_id]"
    fill_in "exam[exam_date]", with: Date.today + 1.week
    fill_in "exam[exam_grade]", with: nil
    click_on 'Create Exam'
    visit exams_path
    click_on 'SHOW'
    click_on 'EDIT'
    fill_in "exam[exam_date]", with: nil
    click_on 'Update Exam'
    expect(page).to have_content('1 error prohibited')
  end

end

RSpec.describe 'Deleting an Exam', type: :feature do
  scenario 'valid inputs' do
    Course.create(course_name:"CSCE_431", course_hours:3)
    visit new_exam_path
    select "CSCE_431", :from =>"exam[course_id]"
    fill_in "exam[exam_date]", with: Date.today + 1.week
    fill_in "exam[exam_grade]", with: nil
    click_on 'Create Exam'
    visit exams_path
    click_on 'SHOW'
    click_on 'DELETE'
    expect(page).to have_content('Exam was successfully destroyed.')
  end
  # exam deletion does not cause errors/there's not a wrong way to do it

  # viewing exam calendar: user
  # sunny day: displays all exams for a user, if user has no exams, blank calendar
  # rainy day: user can see exams from other user
Rspec.describe "Viewing Exam Calendar", type: :feature do
  scenario 'user' do
    Course.create(course_name:"CSCE_431", course_hours:3)
    visit new_exam_path
    select "CSCE_431", :from =>"exam[course_id]"
    fill_in "exam[exam_date]", with: Date.today + 1.week
    fill_in "exam[exam_grade]", with: nil
    click_on 'Create Exam'
    visit exams_path
    click_on 'My Exam Schedule'
    # expect(
    # expect(page).to have_content()
  end
end


  # viewing exam calendar: admin
  # sunny day: displays all exams for the squad, if no exams, blank calendar
  # rainy day: displays only admin exams

end

# integration tests combine two or more aspects of my application in testing
# location: spec/feature/course_integration_spec.rb
require 'rails_helper'


RSpec.describe 'Creating a course', type: :feature do
  # Sunny Day
  scenario 'valid inputs' do
    visit new_course_path
    fill_in "course[course_name]", with: 'CSCE 421'
    fill_in "course[course_hours]", with: 2
    click_on 'Create Course'
    visit courses_path
    expect(page).to have_content('CSCE 421')
  end

  # Rainy Day
  scenario 'invalid inputs: no hours' do
    visit new_course_path
    fill_in "course[course_name]", with: 'CSCE 421'
    click_on 'Create Course'
    expect(page).to have_content('2 errors prohibited this course from being saved')
  end
end

RSpec.describe 'Updating a course', type: :feature do
    # Sunny Day
    scenario 'valid inputs' do
        visit new_course_path
        fill_in "course[course_name]", with: 'CSCE 421'
        fill_in "course[course_hours]", with: 2
        click_on 'Create Course'
        visit courses_path
        click_on 'SHOW'
        click_on 'EDIT'
        fill_in "course[course_hours]", with: 6
        click_on 'Update Course'
        expect(page).to have_content('6')
    end

    # Rainy Day
    scenario 'invalid inputs' do
        visit new_course_path
        fill_in "course[course_name]", with: 'CSCE 421'
        fill_in "course[course_hours]", with: 2
        click_on 'Create Course'
        visit courses_path
        click_on 'SHOW'
        click_on 'EDIT'
        fill_in "course[course_hours]", with: -1
        click_on 'Update Course'
        expect(page).to have_content('Course hours must be greater than 0')
    end
end

RSpec.describe 'Deleting a course', type: :feature do
    # Sunny Day
    scenario 'valid inputs' do
        visit new_course_path
        fill_in "course[course_name]", with: 'CSCE 421'
        fill_in "course[course_hours]", with: 2
        click_on 'Create Course'
        visit courses_path
        click_on 'SHOW'
        click_on 'DELETE'
        expect(page).to have_content('Course was successfully destroyed.')
    end

    # No rainy day as of yet because always can delete
end

# integration tests for exams
# location: spec/feature/exam_integration_spec.rb

require 'rails_helper'

RSpec.describe 'Creating an Exam', type: :feature do
  before(:all) do
    Rails.application.load_seed # or load your custom seed file
  end
  before do
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
     provider: 'google_oauth2',
     uid: '123456',
     info: {
       email: 'ivanattexas@tamu.edu',
       name: 'Ivan Martinez',
       first_name: 'Ivan',
       last_name: 'Martinez',
       image: 'https://lh3.googleusercontent.com/a/AGNmyxZ9w0R3_loFhlk46VAFMyqvC2ZqrZgHuPYnlaAH=s96-c'
     }
   })
    visit new_authuser_session_path
    click_button 'Sign in with Google'
  end

  # sunny day
  scenario 'valid inputs' do
    Course.create(course_name:"CSCE_431", course_hours:3)
    visit new_exam_path
    fill_in "exam[exam_date]", with: Date.today + 1.week
    fill_in "exam[exam_grade]", with: 'A'
    select "CSCE_431", :from =>"exam[course_id]"
    click_on 'Create Exam'
    expect(page).to have_content('Edit')
  end

  # rainy days: no date
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

RSpec.describe 'Editing an Exam', type: :feature do
  before(:all) do
    Rails.application.load_seed # or load your custom seed file
  end
  before do
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
     provider: 'google_oauth2',
     uid: '123456',
     info: {
       email: 'ivanattexas@tamu.edu',
       name: 'Ivan Martinez',
       first_name: 'Ivan',
       last_name: 'Martinez',
       image: 'https://lh3.googleusercontent.com/a/AGNmyxZ9w0R3_loFhlk46VAFMyqvC2ZqrZgHuPYnlaAH=s96-c'
     }
   })
    visit new_authuser_session_path

    click_button 'Sign in with Google'
  end

  # sunny day
  scenario 'valid inputs' do
    Course.create(course_name:"CSCE_431", course_hours:3)
    visit new_exam_path
    select "CSCE_431", :from =>"exam[course_id]"
    fill_in "exam[exam_date]", with: Date.today + 1.week
    fill_in "exam[exam_grade]", with: nil
    click_on 'Create Exam'
    click_on 'Edit'
    fill_in "exam[exam_grade]", with: 'A'
    click_on 'Update Exam'
    expect(page).to have_content('A')
  end

  # rainy days: no date
  # can't select the null option for course, so no course isn't a test

  scenario 'invalid inputs: no date' do
    Course.create(course_name:"CSCE_431", course_hours:3)
    visit new_exam_path
    select "CSCE_431", :from =>"exam[course_id]"
    fill_in "exam[exam_date]", with: Date.today + 1.week
    fill_in "exam[exam_grade]", with: nil
    click_on 'Create Exam'
    click_on 'Edit'
    fill_in "exam[exam_date]", with: nil
    click_on 'Update Exam'
    expect(page).to have_content('1 error prohibited')
  end

end

RSpec.describe 'Deleting an Exam', type: :feature do
  before(:all) do
    Rails.application.load_seed # or load your custom seed file
  end
  before do
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
     provider: 'google_oauth2',
     uid: '123456',
     info: {
       email: 'ivanattexas@tamu.edu',
       name: 'Ivan Martinez',
       first_name: 'Ivan',
       last_name: 'Martinez',
       image: 'https://lh3.googleusercontent.com/a/AGNmyxZ9w0R3_loFhlk46VAFMyqvC2ZqrZgHuPYnlaAH=s96-c'
     }
   })
    visit new_authuser_session_path

    click_button 'Sign in with Google'
  end

  scenario 'valid inputs' do
    Course.create(course_name:"CSCE_431", course_hours:3)
    visit new_exam_path
    select "CSCE_431", :from =>"exam[course_id]"
    fill_in "exam[exam_date]", with: Date.today + 1.week
    fill_in "exam[exam_grade]", with: nil
    click_on 'Create Exam'
    click_on 'Delete'
    expect(page).to have_content('Exam was successfully destroyed.')
  end
  # exam deletion does not cause errors/there's not a wrong way to do it
end

  # viewing exam calendar: user
  # sunny day: displays all exams for a user, if user has no exams, blank calendar
  # rainy day: user can see exams from other user

RSpec.describe "Viewing Exam Calendar", type: :feature do
  before(:all) do
    Rails.application.load_seed # or load your custom seed file
  end
  before do
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
     provider: 'google_oauth2',
     uid: '123456',
     info: {
       email: 'ivanattexas@tamu.edu',
       name: 'Ivan Martinez',
       first_name: 'Ivan',
       last_name: 'Martinez',
       image: 'https://lh3.googleusercontent.com/a/AGNmyxZ9w0R3_loFhlk46VAFMyqvC2ZqrZgHuPYnlaAH=s96-c'
     }
   })
    visit new_authuser_session_path
    click_button 'Sign in with Google'

  end

  scenario 'user, valid inputs' do
    Course.create(course_name:"CSCE_431", course_hours:3)
    visit new_exam_path
    select "CSCE_431", :from =>"exam[course_id]"
    fill_in "exam[exam_date]", with: Date.today + 1.week
    fill_in "exam[exam_grade]", with: nil
    click_on 'Create Exam'
    visit exams_path
    expect(page).to have_content('CSCE_431')
  end

  scenario 'user, blank' do
    visit exams_path
    click_on 'View My Exams'
    expect(page).to_not have_content('CSCE_431')
  end


  # viewing exam calendar: admin
  # sunny day: displays all exams for the squad, if no exams, blank calendar
  # rainy day: displays only admin exams

end

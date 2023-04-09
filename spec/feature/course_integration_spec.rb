# integration tests combine two or more aspects of my application in testing
# location: spec/feature/course_integration_spec.rb
require 'rails_helper'

# require 'oauth_helper'
require './app/controllers/authusers/omniauth_callbacks_controller'

RSpec.describe 'Creating a course', type: :feature do
  # Sunny Day
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
    visit new_course_path
    fill_in 'course[course_name]', with: 'CSCE421'
    fill_in 'course[course_hours]', with: 2
    click_on 'Create Course'
    visit courses_path
    expect(page).to have_content('CSCE421')
  end

  # Rainy Day
  scenario 'invalid inputs: no hours' do
    visit new_authuser_session_path
    visit '/authusers/auth/google_oauth2'

    visit new_course_path
    fill_in 'course[course_name]', with: 'CSCE421'
    click_on 'Create Course'
    expect(page).to have_content('2 errors prohibited this course from being saved')
  end
end

RSpec.describe 'Updating a course', type: :feature do
  # Sunny Day
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
    visit new_authuser_session_path
    visit '/authusers/auth/google_oauth2'

    visit new_course_path
    fill_in 'course[course_name]', with: 'CSCE421'
    fill_in 'course[course_hours]', with: 2
    click_on 'Create Course'
    visit courses_path
    click_on 'SHOW'
    click_on 'EDIT'
    fill_in 'course[course_hours]', with: 6
    click_on 'Update Course'
    expect(page).to have_content('6')
  end

  # Rainy Day
  scenario 'invalid inputs' do
    visit new_authuser_session_path
    visit '/authusers/auth/google_oauth2'

    visit new_course_path
    fill_in 'course[course_name]', with: 'CSCE421'
    fill_in 'course[course_hours]', with: 2
    click_on 'Create Course'
    visit courses_path
    click_on 'SHOW'
    click_on 'EDIT'
    fill_in 'course[course_hours]', with: -1
    click_on 'Update Course'
    expect(page).to have_content('Course hours must be greater than 0')
  end
end

RSpec.describe 'Deleting a course', type: :feature do
  # Sunny Day
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
    visit new_authuser_session_path
    visit '/authusers/auth/google_oauth2'

    visit new_course_path
    fill_in 'course[course_name]', with: 'CSCE421'
    fill_in 'course[course_hours]', with: 2
    click_on 'Create Course'
    visit courses_path
   # find(:xpath, "//tr[td[contains(.,'Foo')]]/td/a", :text => 'manage').click
    click_on 'SHOW'
    click_on 'DELETE'
    expect(page).to have_content('Course was successfully destroyed.')
  end

  # No rainy day as of yet because always can delete
end

RSpec.describe 'Searching for a course', type: :feature do
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

  # course should show up when searched for
  scenario 'search for valid course with exact name match' do
    visit new_authuser_session_path
    visit '/authusers/auth/google_oauth2'

    visit new_course_path
    fill_in 'course[course_name]', with: 'CSCE421'
    fill_in 'course[course_hours]', with: 2
    click_on 'Create Course'
    visit courses_path
    fill_in 'q[course_name_cont]', with: "CSCE421"
    click_on 'Search'
    expect(page).to have_content('CSCE421')
  end

  scenario 'search for valid course with non-exact name match' do
    visit new_authuser_session_path
    visit '/authusers/auth/google_oauth2'

    visit new_course_path
    fill_in 'course[course_name]', with: 'CSCE421'
    fill_in 'course[course_hours]', with: 2
    click_on 'Create Course'
    visit courses_path
    fill_in 'q[course_name_cont]', with: "C"
    click_on 'Search'
    expect(page).to have_content('CSCE421')
  end

  scenario 'search for course that does not exist' do
    visit new_authuser_session_path
    visit '/authusers/auth/google_oauth2'

    visit new_course_path
    fill_in 'course[course_name]', with: 'CSCE421'
    fill_in 'course[course_hours]', with: 2
    click_on 'Create Course'
    visit courses_path
    fill_in 'q[course_name_cont]', with: "P"
    click_on 'Search'
    page.should have_no_content('CSCE421')
  end
end
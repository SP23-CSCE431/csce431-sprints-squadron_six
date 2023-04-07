# # integration tests combine two or more aspects of my application in testing
# # location: spec/feature/course_integration_spec.rb
# require 'rails_helper'

# # require 'oauth_helper'
# require './app/controllers/authusers/omniauth_callbacks_controller'

# RSpec.describe 'Creating a course', type: :feature do
#   # Sunny Day
#   scenario 'valid inputs' do
#     # mock_auth_hash(:google_oauth2, 'ivanattexas@tamu.edu')
#     visit new_authuser_session_path
#     # visit '/authusers/auth/google_oauth2'

#     click_button 'Sign in with Google'

#     # visit new_course_path
#     # fill_in 'course_name', with: 'CSCE 421'
#     # fill_in 'course_hours', with: 2
#     # click_on 'Create Course'

#     expect(page).to have_content('Courses')
#   end

#   # Rainy Day
#   scenario 'invalid inputs: no hours' do
#     visit new_authuser_session_path
#     visit '/authusers/auth/google_oauth2'

#     visit new_course_path
#     fill_in 'course[course_name]', with: 'CSCE 421'
#     click_on 'Create Course'
#     expect(page).to have_content('2 errors prohibited this course from being saved')
#   end
# end

# RSpec.describe 'Updating a course', type: :feature do
#   # Sunny Day
#   scenario 'valid inputs' do
#     visit new_authuser_session_path
#     visit '/authusers/auth/google_oauth2'

#     visit new_course_path
#     fill_in 'course[course_name]', with: 'CSCE 421'
#     fill_in 'course[course_hours]', with: 2
#     click_on 'Create Course'
#     visit courses_path
#     click_on 'SHOW'
#     click_on 'EDIT'
#     fill_in 'course[course_hours]', with: 6
#     click_on 'Update Course'
#     expect(page).to have_content('6')
#   end

#   # Rainy Day
#   scenario 'invalid inputs' do
#     visit new_authuser_session_path
#     visit '/authusers/auth/google_oauth2'

#     visit new_course_path
#     fill_in 'course[course_name]', with: 'CSCE 421'
#     fill_in 'course[course_hours]', with: 2
#     click_on 'Create Course'
#     visit courses_path
#     click_on 'SHOW'
#     click_on 'EDIT'
#     fill_in 'course[course_hours]', with: -1
#     click_on 'Update Course'
#     expect(page).to have_content('Course hours must be greater than 0')
#   end
# end

# RSpec.describe 'Deleting a course', type: :feature do
#   # Sunny Day
#   scenario 'valid inputs' do
#     visit new_authuser_session_path
#     visit '/authusers/auth/google_oauth2'

#     visit new_course_path
#     fill_in 'course[course_name]', with: 'CSCE 421'
#     fill_in 'course[course_hours]', with: 2
#     click_on 'Create Course'
#     visit courses_path
#     click_on 'SHOW'
#     click_on 'DELETE'
#     expect(page).to have_content('Course was successfully destroyed.')
#   end

#   # No rainy day as of yet because always can delete
# end
# integration tests combine two or more aspects of my application in testing
# location: spec/feature/course_integration_spec.rb
require 'rails_helper'

# require 'oauth_helper'
require './app/controllers/authusers/omniauth_callbacks_controller'
require 'omniauth-google-oauth2'
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
  end
  scenario 'valid inputs' do
    # mock_auth_hash(:google_oauth2, 'ivanattexas@tamu.edu')
    visit new_authuser_session_path

    click_button 'Sign in with Google'

    visit courses_path
    # visit new_course_path
    # fill_in 'course_name', with: 'CSCE 421'
    # fill_in 'course_hours', with: 2
    # click_on 'Create Course'

    save_and_open_page
    expect(page).to have_content('Courses')
  end

  # Rainy Day
  scenario 'invalid inputs: no hours' do
    visit new_authuser_session_path
    visit '/authusers/auth/google_oauth2'

    visit new_course_path
    fill_in 'course[course_name]', with: 'CSCE 421'
    click_on 'Create Course'
    expect(page).to have_content('2 errors prohibited this course from being saved')
  end
end

RSpec.describe 'Updating a course', type: :feature do
  # Sunny Day
  scenario 'valid inputs' do
    visit new_authuser_session_path
    visit '/authusers/auth/google_oauth2'

    visit new_course_path
    fill_in 'course[course_name]', with: 'CSCE 421'
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
    fill_in 'course[course_name]', with: 'CSCE 421'
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
  scenario 'valid inputs' do
    visit new_authuser_session_path
    visit '/authusers/auth/google_oauth2'

    visit new_course_path
    fill_in 'course[course_name]', with: 'CSCE 421'
    fill_in 'course[course_hours]', with: 2
    click_on 'Create Course'
    visit courses_path
    click_on 'SHOW'
    click_on 'DELETE'
    expect(page).to have_content('Course was successfully destroyed.')
  end

  # No rainy day as of yet because always can delete
end

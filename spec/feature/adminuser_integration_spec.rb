require 'rails_helper'
RSpec.describe 'Creating an Admin User', type: :feature do
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
  scenario 'creates a new admin user that is a admin' do
    visit new_adminuser_path

    fill_in 'Email', with: 'admin@example.com'
    check # assuming your form has a checkbox for isadmin
    click_button 'Create User'

    expect(page).to have_content('Adminuser was successfully created.')
    expect(page).to have_content('admin@example.com')
  end
  scenario 'creates a new admin user that is not a admin' do
    visit new_adminuser_path

    fill_in 'Email', with: 'admin@example.com'
    click_button 'Create User'

    expect(page).to have_content('Adminuser was successfully created.')
    expect(page).to have_content('admin@example.com')
  end
end

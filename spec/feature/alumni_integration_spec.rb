# integration tests for alumnis
require 'rails_helper'
# require 'test_helper'
RSpec.describe 'Creating an Alumni', type: :feature do
  # sunny day
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
    # mock_google_oauth2
    # click_link "Sign in with Google"
    #User.create(user_fname: 'Evan', user_lname: 'Qin', user_email: 'qinyif001@tamu.edu', user_password: 'tamucomputerscience',
                #user_role: 'Alumni', user_grad_year: Date.today + 1.week, user_points: 999)
    Company.create(company_name: 'HP', company_location: 'Houston', company_industry: 'Softwares')
    visit new_alumni_path
    click_on 'Back to Alumnis'
    click_on 'New Alumni'
    select 'Ivan Martinez', from: 'alumni[user_id]'
    select 'HP', from: 'alumni[company_id]'
    click_on 'Create Alumni'
    expect(page).to have_content('successfully created')
  end

  # rainy days where there does not exist a company that could be added to the alumni
  scenario 'invalid inputs, missing company' do
    #User.create(user_fname: 'Evan', user_lname: 'Qin', user_email: 'qinyif001@tamu.edu', user_password: 'tamucomputerscience',
                #user_role: 'Alumni', user_grad_year: Date.today + 1.week, user_points: 999)
    visit new_alumni_path
    select 'Ivan Martinez', from: 'alumni[user_id]'
    click_on 'Create Alumni'
    expect(page).to have_content('Company must exist')
  end
  # rainy days where there does not exist a User that could be added to the alumni (removed due to change in structure, this will not happen)
  
  # sunny day
  scenario 'modify alumni' do
    Company.create(company_name: 'HP', company_location: 'Houston', company_industry: 'Softwares')
    Company.create(company_name: 'Apple', company_location: 'Houston', company_industry: 'Softwares/Hardwares')
    visit new_alumni_path
    select 'Ivan Martinez', from: 'alumni[user_id]'
    select 'HP', from: 'alumni[company_id]'
    click_on 'Create Alumni'
    visit alumnis_path
    click_on 'SHOW'
    click_on 'Edit'
    select 'Apple', from: 'alumni[company_id]'
    expect(page).to have_content('Apple')
  end
  # rainy day, there can not be a rainy day for modifying an alumni because there will have to be at least one company for alumni and there is nothing you can do to give a drop down menu invalid input.
  # sunny day
  scenario 'delete alumni' do
    Company.create(company_name: 'HP', company_location: 'Houston', company_industry: 'Softwares')
    Company.create(company_name: 'Apple', company_location: 'Houston', company_industry: 'Softwares/Hardwares')
    visit new_alumni_path
    select 'Ivan Martinez', from: 'alumni[user_id]'
    select 'HP', from: 'alumni[company_id]'
    click_on 'Create Alumni'
    visit alumnis_path
    click_on 'SHOW'
    click_on 'Delete'
    expect(page).to have_content('Alumni was successfully destroyed.')
  end
  # scenario 'delete alumni' do
  # visit new_alumni_path
  # expect(page).to have_content('Help')
  # end
  scenario 'Search alumni' do
    Company.create(company_name: 'HP', company_location: 'Houston', company_industry: 'Softwares')
    Company.create(company_name: 'Apple', company_location: 'Houston', company_industry: 'Softwares/Hardwares')
    visit new_alumni_path
    select 'Ivan Martinez', from: 'alumni[user_id]'
    select 'HP', from: 'alumni[company_id]'
    click_on 'Create Alumni'
    visit alumnis_path
    fill_in "Search for an alumni by name", with: 'Martinez'
    click_on 'Search'
    expect(page).to have_content('Martinez')
  end

  scenario 'Search alumni rainy day' do
    Company.create(company_name: 'HP', company_location: 'Houston', company_industry: 'Softwares')
    Company.create(company_name: 'Apple', company_location: 'Houston', company_industry: 'Softwares/Hardwares')
    visit new_alumni_path
    select 'Ivan Martinez', from: 'alumni[user_id]'
    select 'HP', from: 'alumni[company_id]'
    click_on 'Create Alumni'
    visit alumnis_path
    fill_in "Search for an alumni by name", with: 'Martinezaaaa'
    click_on 'Search'
    expect(page).to_not have_content('Martinez')
  end
  scenario 'Navigate to help page' do
    visit alumnis_path
    click_on 'Help'
    expect(page).to have_content('Alumni Tracker Help Page')
  end
  scenario 'Navigate back from help page' do
    visit alumnis_path
    click_on 'Help'
    click_on 'Back to Alumnis'
    expect(page).to have_content('New Alumni')
  end
end

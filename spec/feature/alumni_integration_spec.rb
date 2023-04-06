# integration tests for alumnis
require 'rails_helper'

RSpec.describe 'Creating an Alumni', type: :feature do
  # sunny day
  scenario 'valid inputs' do
    User.create(user_fname:"Evan", user_lname:"Qin",user_email:"qinyif001@tamu.edu",user_password:"tamucomputerscience",user_role:"Alumni",user_grad_year:Date.today + 1.week,user_points:999)
    Company.create(company_name:"HP", company_location:"Houston", company_industry:"Softwares")
    visit new_alumni_path
    click_on 'Back to Alumnis'
    click_on 'New Alumni'
    select "Qin", :from =>"alumni[user_id]"
    select "HP", :from =>"alumni[company_id]"
    click_on 'Create Alumni'
    expect(page).to have_content('successfully created')
  end

  #rainy days where there does not exist a company that could be added to the alumni
  scenario 'ivalid inputs, missing company' do
    User.create(user_fname:"Evan", user_lname:"Qin",user_email:"qinyif001@tamu.edu",user_password:"tamucomputerscience",user_role:"Alumni",user_grad_year:Date.today + 1.week,user_points:999)
    visit new_alumni_path
    select "Qin", :from =>"alumni[user_id]"
    click_on 'Create Alumni'
    expect(page).to have_content('Company must exist')
  end
  #rainy days where there does not exist a User that could be added to the alumni
  scenario 'ivalid inputs, missing user' do
    Company.create(company_name:"HP", company_location:"Houston", company_industry:"Softwares")
    visit new_alumni_path
    select "HP", :from =>"alumni[company_id]"
    click_on 'Create Alumni'
    expect(page).to have_content('User must exist')
  end
  # sunny day
  scenario 'modify alumni' do
    User.create(user_fname:"Evan", user_lname:"Qin",user_email:"qinyif001@tamu.edu",user_password:"tamucomputerscience",user_role:"Alumni",user_grad_year:Date.today + 1.week,user_points:999)
    Company.create(company_name:"HP", company_location:"Houston", company_industry:"Softwares")
    Company.create(company_name:"Apple", company_location:"Houston", company_industry:"Softwares/Hardwares")
    visit new_alumni_path
    select "Qin", :from =>"alumni[user_id]"
    select "HP", :from =>"alumni[company_id]"
    click_on 'Create Alumni'
    visit alumnis_path
    click_on 'Details about this Alumni'
    click_on 'Edit this alumni'
    select "Apple", :from =>"alumni[company_id]"
    expect(page).to have_content('Apple')
  end
  #rainy day, there can not be a rainy day for modifying an alumni because there will have to be at least one company for alumni and there is nothing you can do to give a drop down menu invalid input.
  #sunny day
  scenario 'delete alumni' do
    User.create(user_fname:"Evan", user_lname:"Qin",user_email:"qinyif001@tamu.edu",user_password:"tamucomputerscience",user_role:"Alumni",user_grad_year:Date.today + 1.week,user_points:999)
    Company.create(company_name:"HP", company_location:"Houston", company_industry:"Softwares")
    Company.create(company_name:"Apple", company_location:"Houston", company_industry:"Softwares/Hardwares")
    visit new_alumni_path
    select "Qin", :from =>"alumni[user_id]"
    select "HP", :from =>"alumni[company_id]"
    click_on 'Create Alumni'
    visit alumnis_path
    click_on 'Details about this Alumni'
    click_on 'Destroy this alumni'
    expect(page).to have_content('Alumni was successfully destroyed.')
  end
  #scenario 'delete alumni' do
    #visit new_alumni_path
    #expect(page).to have_content('Help')
  #end
end
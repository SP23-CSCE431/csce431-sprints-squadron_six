require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test 'visiting the index' do
    visit users_url
    assert_selector 'h1', text: 'Users'
  end

  test 'should create user' do
    visit users_url
    click_on 'New Entry'

    fill_in 'User email', with: @user.user_email
    fill_in 'User fname', with: @user.user_fname
    fill_in 'User grad year', with: @user.user_grad_year
    fill_in 'User lname', with: @user.user_lname
    fill_in 'User password', with: @user.user_password
    fill_in 'User points', with: @user.user_points
    fill_in 'User role', with: @user.user_role
    click_on 'Create User'

    assert_text 'User was successfully created'
    click_on 'Back'
  end

  test 'should update User' do
    visit user_url(@user)
    click_on 'Edit this user', match: :first

    fill_in 'User email', with: @user.user_email
    fill_in 'User fname', with: @user.user_fname
    fill_in 'User grad year', with: @user.user_grad_year
    fill_in 'User lname', with: @user.user_lname
    fill_in 'User password', with: @user.user_password
    fill_in 'User points', with: @user.user_points
    fill_in 'User role', with: @user.user_role
    click_on 'Update User'

    assert_text 'User was successfully updated'
    click_on 'Back'
  end

  test 'should destroy User' do
    visit user_url(@user)
    click_on 'Destroy this user', match: :first

    assert_text 'User was successfully destroyed'
  end
end

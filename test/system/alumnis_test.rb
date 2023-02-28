require "application_system_test_case"

class AlumnisTest < ApplicationSystemTestCase
  setup do
    @alumni = alumnis(:one)
  end

  test "visiting the index" do
    visit alumnis_url
    assert_selector "h1", text: "Alumnis"
  end

  test "should create alumni" do
    visit alumnis_url
    click_on "New alumni"

    fill_in "Company", with: @alumni.company_id
    fill_in "User", with: @alumni.user_id
    click_on "Create Alumni"

    assert_text "Alumni was successfully created"
    click_on "Back"
  end

  test "should update Alumni" do
    visit alumni_url(@alumni)
    click_on "Edit this alumni", match: :first

    fill_in "Company", with: @alumni.company_id
    fill_in "User", with: @alumni.user_id
    click_on "Update Alumni"

    assert_text "Alumni was successfully updated"
    click_on "Back"
  end

  test "should destroy Alumni" do
    visit alumni_url(@alumni)
    click_on "Destroy this alumni", match: :first

    assert_text "Alumni was successfully destroyed"
  end
end

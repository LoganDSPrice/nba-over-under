require "application_system_test_case"

class ContestantsTest < ApplicationSystemTestCase
  setup do
    @contestant = contestants(:one)
  end

  test "visiting the index" do
    visit contestants_url
    assert_selector "h1", text: "Contestants"
  end

  test "creating a Contestant" do
    visit contestants_url
    click_on "New Contestant"

    fill_in "Email", with: @contestant.email
    fill_in "Name", with: @contestant.name
    click_on "Create Contestant"

    assert_text "Contestant was successfully created"
    click_on "Back"
  end

  test "updating a Contestant" do
    visit contestants_url
    click_on "Edit", match: :first

    fill_in "Email", with: @contestant.email
    fill_in "Name", with: @contestant.name
    click_on "Update Contestant"

    assert_text "Contestant was successfully updated"
    click_on "Back"
  end

  test "destroying a Contestant" do
    visit contestants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contestant was successfully destroyed"
  end
end

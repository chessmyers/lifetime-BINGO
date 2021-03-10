require "application_system_test_case"

class BingoHallsTest < ApplicationSystemTestCase
  setup do
    @bingo_hall = bingo_halls(:one)
  end

  test "visiting the index" do
    visit bingo_halls_url
    assert_selector "h1", text: "Bingo Halls"
  end

  test "creating a Bingo hall" do
    visit bingo_halls_url
    click_on "New Bingo Hall"

    fill_in "Name", with: @bingo_hall.name
    click_on "Create Bingo hall"

    assert_text "Bingo hall was successfully created"
    click_on "Back"
  end

  test "updating a Bingo hall" do
    visit bingo_halls_url
    click_on "Edit", match: :first

    fill_in "Name", with: @bingo_hall.name
    click_on "Update Bingo hall"

    assert_text "Bingo hall was successfully updated"
    click_on "Back"
  end

  test "destroying a Bingo hall" do
    visit bingo_halls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bingo hall was successfully destroyed"
  end
end

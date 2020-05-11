require "application_system_test_case"

class ShowDetailsTest < ApplicationSystemTestCase
  setup do
    @show_detail = show_details(:one)
  end

  test "visiting the index" do
    visit show_details_url
    assert_selector "h1", text: "Show Details"
  end

  test "creating a Show detail" do
    visit show_details_url
    click_on "New Show Detail"

    fill_in "Date", with: @show_detail.date
    fill_in "Movie", with: @show_detail.movie_id
    fill_in "Theatre", with: @show_detail.theatre_id
    fill_in "Ticket fee", with: @show_detail.ticket_fee
    fill_in "Timing", with: @show_detail.timing
    click_on "Create Show detail"

    assert_text "Show detail was successfully created"
    click_on "Back"
  end

  test "updating a Show detail" do
    visit show_details_url
    click_on "Edit", match: :first

    fill_in "Date", with: @show_detail.date
    fill_in "Movie", with: @show_detail.movie_id
    fill_in "Theatre", with: @show_detail.theatre_id
    fill_in "Ticket fee", with: @show_detail.ticket_fee
    fill_in "Timing", with: @show_detail.timing
    click_on "Update Show detail"

    assert_text "Show detail was successfully updated"
    click_on "Back"
  end

  test "destroying a Show detail" do
    visit show_details_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Show detail was successfully destroyed"
  end
end

require "application_system_test_case"

class AuctionsTest < ApplicationSystemTestCase
  setup do
    @auction = auctions(:one)
  end

  test "visiting the index" do
    visit auctions_url
    assert_selector "h1", text: "Auctions"
  end

  test "creating a Auction" do
    visit auctions_url
    click_on "New Auction"

    fill_in "Description", with: @auction.description
    fill_in "Expiration date", with: @auction.expiration_date
    fill_in "Price", with: @auction.price
    fill_in "Starting price", with: @auction.starting_price
    fill_in "Status", with: @auction.status
    fill_in "Title", with: @auction.title
    click_on "Create Auction"

    assert_text "Auction was successfully created"
    click_on "Back"
  end

  test "updating a Auction" do
    visit auctions_url
    click_on "Edit", match: :first

    fill_in "Description", with: @auction.description
    fill_in "Expiration date", with: @auction.expiration_date
    fill_in "Price", with: @auction.price
    fill_in "Starting price", with: @auction.starting_price
    fill_in "Status", with: @auction.status
    fill_in "Title", with: @auction.title
    click_on "Update Auction"

    assert_text "Auction was successfully updated"
    click_on "Back"
  end

  test "destroying a Auction" do
    visit auctions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Auction was successfully destroyed"
  end
end

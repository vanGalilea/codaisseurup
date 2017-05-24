require "rails_helper"

describe "Terms and Conditions Page" do
  it "shows information about the application" do
    visit root_url
    click_on "Terms & Conditions"

    expect(page).to have_content "These are the terms and conditions"
  end
end

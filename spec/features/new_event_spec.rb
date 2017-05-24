require "rails_helper"

describe "Creating new event" do
  before do
    login_as user
    visit events_url
    click_on "Add new event"
  end

  context "fill in the form succefully" do
    let(:user) { create :user }

    it "no errors" do
      fill_in "event_name", with: "Something"
      fill_in "event_description", with: "bal bla bla..."
      click_on "Save"
      expect(page).to have_content "Event successfully created"
    end

    it "without description" do
      fill_in "event_name", with: "Something"
      fill_in "event_description", with: nil
      click_on "Save"
      expect(page).to have_content "Description can't be blank"
    end
  end

end

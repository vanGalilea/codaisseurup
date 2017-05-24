require 'rails_helper'

describe "Navigating events" do
  before { login_as user }

  let(:user) { create :user }
  let!(:event) { create :event , user: user }

  it "allows navigation from the event page to the events page" do
    visit event_url(event)

    click_link "Back"
    expect(current_path).to eq(events_path)
  end

  it "allows navigation from the events to the event page" do
  visit events_url

  click_link "View"
  expect(current_path).to eq(event_path(event))
  end

end

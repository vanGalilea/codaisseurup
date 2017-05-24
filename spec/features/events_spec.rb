require 'rails_helper'

describe "Current user viewing the list of events" do
  before { login_as user }

  let(:user) { create :user, email: "current@user.com" }
  let(:another_user) { create :user, email: "another@user.com" }

  let!(:event1) { create :event, name: "bla", user: user }
  let!(:event2) { create :event, name: "bal bal", user: user }
  let!(:event3) { create :event, name: "Yo yo", user: another_user }

  it "shows all his events" do
    visit events_url

    expect(page).to have_text(event1.name)
    expect(page).to have_text(event2.name)
  end

  it "does not show other users events" do
    visit events_url

    expect(page).not_to have_text("Another users room")
  end

end

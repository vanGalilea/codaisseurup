require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create :user }
  let!(:event) { create :event, user: user}

  describe "association with event" do
    it { should have_many(:events) }
  end

  describe "association with profile" do
    it { should have_one(:profile) }

    it "deletes associated events" do
      expect { user.destroy }.to change(Event, :count).by(-1)
    end
  end


  describe "association with registration" do
    let(:guest_user) { create :user, email: "guest@user.com" }
    let(:host_user) { create :user, email: "host@user.com" }

    let!(:event) { create :event, user: host_user }
    let!(:registration) { create :registration, event: event, user: guest_user }

    it "has registrations" do
      expect(guest_user.registarted_events).to include(event)
    end
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create :user }
  let!(:event) { create :event, user: user}

  describe "association with event" do
    it { should have_many(:events) }
  end

  describe "association with profile" do
    it { should have_one(:profile) }
  end

    it "deletes associated events" do
      expect { user.destroy }.to change(Event, :count).by(-1)
    end
end

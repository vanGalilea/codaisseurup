require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe ".by_initial" do
    subject { Profile.by_initial("S") }

    let(:user1) { create :user }
    let(:user2) { create :user }
    let(:user3) { create :user }
    let(:profile1) { create :profile, first_name: "Sander", user: user1 }
    let(:profile2) { create :profile, first_name: "Stefan", user: user2  }
    let(:profile3) { create :profile, first_name: "Wouter", user: user3  }


    it "returns a sorted array of results that match" do
      expect(subject).to match_array [profile1, profile2]
      expect(subject).not_to include profile3
    end
  end

  describe "belongs to user" do
    it {should belong_to(:user)}
  end
end

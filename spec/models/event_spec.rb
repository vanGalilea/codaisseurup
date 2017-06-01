require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:starts_at) }
    it { should validate_presence_of(:ends_at) }
    it { should validate_presence_of(:description) }
    it { should validate_length_of(:description).is_at_most(500) }
  end

  describe "association with user" do
    it { should belong_to(:user) }
  end

  describe "association with theme" do
    it { should have_and_belong_to_many(:themes) }
  end

  describe ".published" do
     let!(:event1) { create :event, active: true }
     let!(:event2) { create :event, active: false }
     let!(:event3) { create :event, active: true }

     it "returns an array of events which are active" do
       expect(Event.published).to match_array [event1, event3]
     end
   end

  describe ".order_by_name" do
    let!(:event1) { create :event, name: "Avocado eating contest" }
    let!(:event2) { create :event, name: "Comics convetion" }
    let!(:event3) { create :event, name: "Borito workshop" }

    it "returns a sorted array of events by names" do
      expect(Event.order_by_name).to match_array [event1, event3, event2]
    end
  end

  describe "#bargain?" do
   let(:bargain_event) { create :event, price: 8 }
   let(:non_bargain_event) { create :event, price: 20 }

   it "returns true if the price is smaller than 10 EUR" do
     expect(bargain_event.bargain?).to eq(true)
     expect(non_bargain_event.bargain?).to eq(false)
   end
 end

 describe ".order_by_price" do
    let!(:event1) { create :event, price: 100 }
    let!(:event2) { create :event, price: 200 }
    let!(:event3) { create :event, price: 300 }

    it "returns a sorted array of events by prices" do
      expect(Event.order_by_price).to match_array [event1, event2, event3]
    end
  end

  describe "association with registration" do
  let(:guest_user) { create :user, email: "guest@user.com" }
  let(:host_user) { create :user, email: "host@user.com" }

  let!(:event) { create :event, user: host_user }
  let!(:registration) { create :registration, event: event, user: guest_user }

  it "has guests" do
    expect(event.guests).to include(guest_user)
  end
end

end

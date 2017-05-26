require 'rails_helper'

RSpec.describe Registration, type: :model do
  describe "set status func" do
    let(:user) { create :user }
    let(:registration) { create :registration, event: event, user: user }

    context "free event" do
      let(:event) { create :event, price: 0.00 }

      it "status confirmed" do
        expect(registration.status).to eq("confirmed")
      end
    end

    context "event with price" do
      let(:event) { create :event, price: 20.00 }

      it "status is pending" do
        expect(registration.status).to eq("pending")
      end
    end
  end

  describe "set total price func" do
    let(:user) { create :user }
    let(:registration) { create :registration, event: event, guests_count: 2, user: user }
    let(:event) { create :event, price: 5.00 }

      it "with 2 guests" do
        expect(registration.price).to eq(10)
      end
    end

end

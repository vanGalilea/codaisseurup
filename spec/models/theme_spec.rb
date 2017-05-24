require 'rails_helper'

RSpec.describe Theme, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  describe "association with event" do
    it { should have_many(:events) }
  end

end

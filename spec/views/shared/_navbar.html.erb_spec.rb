require 'rails_helper'

describe "shared/_navbar.html.erb" do
  before { sign_in user }

  context "without profile" do
    let(:user) { create :user }

    it "renders email" do
      render
      expect(rendered).to have_content user.email
    end
  end

  context "with profile" do
    let(:profile) { build :profile }
    let(:user) { create :user, profile: profile }

    it "renders first and last name" do
      render
      expect(rendered).to have_content profile.first_name
      expect(rendered).to have_content profile.last_name
    end
  end

end

describe "shared/_navbar.html.erb" do
  context "without user" do
    it "renders log in and sign in without " do
      render
      expect(rendered).to have_content "Log-in"
      expect(rendered).to have_content "Sign-up"
    end
  end
end

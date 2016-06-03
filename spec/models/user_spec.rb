require 'rails_helper'

RSpec.describe User, type: :model do
  context "for record creation" do
    it "has a valid factory" do
      expect(FactoryGirl.build(:user)).to be_valid
    end

    it "should have username, email and password" do
      should have_db_column(:username).of_type(:string)
      should have_db_column(:email).of_type(:string)
    end
  end

  context "validation" do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    
      describe "password format requirement" do
        it { is_expected.to validate_presence_of(:password) }
        it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(20) }
        it { is_expected.to validate_confirmation_of(:password) }
      end

    it "is invalid without proper email format" do
      expect(FactoryGirl.build(:user, email: "abc")).to be_invalid
    end

    it "user can sign up when all parameters is present" do
      expect(FactoryGirl.build(:user)).to be_valid
    end

  end

end

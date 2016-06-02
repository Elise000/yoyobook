require 'rails_helper'

RSpec.describe User, type: :model do
  context "record creation" do
    it "has a valid factory" do
      expect(FactoryGirl.build(:user)).to be_valid
    end

    it "should have username, email and password" do
      should have_db_column(:username).of_type(:string)
      should have_db_column(:email).of_type(:string)
      should have_db_column(:password).of_type(:string)
    end
  end

  context "validation" do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
    
    it "is invalid without a lastname" do
      FactoryGirl.build(:user, password: nil).should_not be_valid
    end

    it "is invalid without proper email" do
      FactoryGirl.build(:user, email: "abc").should_not be_valid
    end

    it "user can sign up when all three parameters is present" do
      expect(FactoryGirl.build(:user)).to be_valid
    end
  end

end

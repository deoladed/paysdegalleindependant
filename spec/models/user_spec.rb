require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
		@user = FactoryBot.create(:user)  	
  end

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
    end
    describe "#email" do
      it {expect(@user).to validate_presence_of(:email)}
      # it {expect(@user).to validate_uniqueness_of(:email)}
      it {is_expected.to allow_value("cyber_snow@hotmail.com").for(:email)}
      it {is_expected.to allow_value("a@b.com").for(:email)}
      it {is_expected.to allow_value("cyber@snow.com").for(:email)}
      it {is_expected.to allow_value("cyber_snow@gmail.com").for(:email)}
      it {is_expected.to allow_value("cyb@gil.com").for(:email)}
      it {is_expected.to_not allow_value("cyber_snowgmail.com").for(:email)}
      it {is_expected.to_not allow_value("cyber_sno@gmailcom").for(:email)}
      it {is_expected.to_not allow_value("cyber_snow@").for(:email)}
	end

    describe "#username" do
      it {expect(@user).to validate_presence_of(:username)}
      it {expect(@user).to validate_uniqueness_of(:username)}
      it {is_expected.to allow_value("Taraceboolba").for(:username)}
      it {is_expected.to allow_value("Oui").for(:username)}
      it {is_expected.to_not allow_value("").for(:username)}
      it {is_expected.to_not allow_value(356).for(:username)}
	end

    describe "#is_admin" do
      it {is_expected.to allow_value(true).for(:is_admin)}
      it {is_expected.to allow_value(false).for(:is_admin)}
	end

   #  describe "#password" do
   #    it {expect(@user).to have_secure_password}
	  # end
  end

  context "associations" do
    it { expect(@user).to have_many(:orders) }
    it { expect(@user).to have_one(:cart) }
  end

end
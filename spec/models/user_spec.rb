require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    before(:each) do
      @user = User.new
    end
    
    it { should validate_presence_of(:password)}
  
    it "checks for password_confirmation" do
      # @user.name = "New Test user"
      @user.first_name = "a"
      @user.last_name = "user"
      @user.email = "user@domain.com"
      @user.password = "notsosecurepassword"
      @user.password_confirmation = "ecurepassword"
  
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eq ["Password confirmation doesn't match Password"]
    end
    
    it { should validate_uniqueness_of(:email)}
    
    it { should validate_presence_of(:email)}
  
    it { should validate_presence_of(:first_name)}
  
    it { should validate_presence_of(:last_name)}
  
    it "checks for password minimum length" do
      # @user.name = "New Test user"
      @user.first_name = "a"
      @user.last_name = "user"
      @user.email = "user@domain.com"
      @user.password = "n"
      @user.password_confirmation = "n"
  
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to eq ["Password is too short (minimum is 8 characters)"]
    end
  end



  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.new
      @user.first_name = "a"
      @user.last_name = "user"
      @user.email = "user@doMAIn.com"
      @user.password = "notsosecurepassword"

      @user.save!
    end


    it "should not authenticate invalid email password combo" do
      expect(@user.authenticate_with_credentials(@user.email, "wrongpassword")).to be_nil
    end

    it "should authenticate valid email password combo" do
      expect(@user.authenticate_with_credentials(@user.email, "notsosecurepassword")).to be_truthy
    end

    it "should authenticate user even with wrong case for email" do 
      expect(@user.authenticate_with_credentials(@user.email, "notsosecurepassword")).to be_truthy
    end  


  end

end



require 'rails_helper'

RSpec.describe User, type: :model do

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



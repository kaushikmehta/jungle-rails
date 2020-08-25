class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  has_secure_password
  validates :password, length: { minimum: 8, maximum: 20 }, on: :create
  
  before_save do 
    self.first_name = self.first_name.capitalize if self.first_name_changed?
    self.last_name = self.last_name.capitalize if self.last_name_changed?
    self.email = self.email.downcase if self.email_changed?
  end

  def authenticate_with_credentials(email, password)
   @email = email.downcase
   @password = password
      
   @user = User.find_by(email: @email)
   
    if @user.present? && @user.authenticate(@password)
      return @user
    else 
      return nil
    end

  end

end

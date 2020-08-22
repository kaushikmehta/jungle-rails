class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  # validates :password, presence: true
  has_secure_password
  before_save do 
    self.first_name = self.first_name.capitalize if self.first_name_changed?
    self.last_name = self.last_name.capitalize if self.last_name_changed?
    self.email = self.email.downcase if self.email_changed?
  end
end

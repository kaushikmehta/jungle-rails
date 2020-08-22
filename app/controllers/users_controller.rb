class UsersController < ApplicationController
  # before_action:
  def authenticate
    @user = User.find_by(email: user_params[:email])
    if @user.present? && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      return redirect_to root_path, notice: 'Logged in successfully'
    else 
      return redirect_to sign_in_users_path, alert: 'It seems like the email address or password is incorrect'
    end
  end

  def register
    @user = User.new
  end

  def create
    @user = User.new(user_params) 
    if user_params[:password] == user_params[:password_confirmation]
      if @user.save!
        session[:user_id] = @user.id
        return redirect_to root_path, notice: 'User created successfully'
      else
        return redirect_to register_users_path, alert: 'Unable to create the user for some reason. Please try again'
      end
    else
      return redirect_to register_users_path, alert: 'Passwords did not match'
    end
  end

  def sign_in
      @user = User.new
  end

  def sign_out
    session[:user_id] = nil
    redirect_to root_url, :notice => 'Logged out!'
  end


  
  private
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
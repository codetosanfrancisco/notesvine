class UsersController < Devise::RegistrationsController
  def create
    super 
    if User.exists?(resource.id)
      UserMailer.send_signup_email(resource).deliver_later
    end
  end
  
  private
    def sign_up_params
        params.require(:user).permit(:email,:password,:firstname,:lastname,:password_confirmation)
    end
    
    def account_update_params
         params.require(:user).permit(:email,:password,:first_name,:last_name)
    end
end

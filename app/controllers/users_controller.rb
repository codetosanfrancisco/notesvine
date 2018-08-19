class UsersController < Devise::RegistrationsController
  
  private
    def sign_up_params
        params.require(:user).permit(:email,:password,:firstname,:lastname,:password_confirmation)
    end
    
    def account_update_params
         params.require(:user).permit(:email,:password,:first_name,:last_name)
    end
end

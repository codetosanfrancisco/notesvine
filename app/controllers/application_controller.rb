class ApplicationController < ActionController::Base
    include Pundit
    before_action :authenticate_user!
    before_action :set_category
    helper_method :current_category
    rescue_from ActiveRecord::RecordNotFound,with: :redirection
    rescue_from Pundit::NotAuthorizedError,with: :redirection
    
    private 
    def set_category
        @categories = current_user.try(:categories)
    end
    
    def redirection
        flash[:danger] = "You cannot enter this page."
        redirect_back(fallback_location: root_path) 
    end
end

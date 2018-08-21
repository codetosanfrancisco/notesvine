class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :set_category
    
    helper_method :current_category
    private 
    def set_category
        @categories = current_user.try(:categories)
    end
    
    def current_category
       @category ||= Category.find(session[:category_id]) 
    end
end

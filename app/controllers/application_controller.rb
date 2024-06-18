class ApplicationController < ActionController::Base

    helper_method :user_login?, :current_user

    def current_user
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
    end

    def user_login?
        !!current_user
    end

    def authorized
        redirect_to login_path unless user_login?
    end
end

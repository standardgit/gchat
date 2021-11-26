class ApplicationController < ActionController::Base

    def current_user
        if session[:user_id].present?
            @current_user = User.find(session[:user_id])
        else
            @current_user = User.generate
            session[:user_id] = @current_user.id
        end
    end

end

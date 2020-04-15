class ApplicationController < ActionController::API

    def current_user
        User.first
    end

    def logged_in?
        true
    end
##placeholders to test functionality of front end

end

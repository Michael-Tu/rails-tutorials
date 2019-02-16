class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            log_in(user) # or log_in user
            redirect_to user_url(user) # or: redirect_to user
        else
            flash.now[:danger] = "Invalid email/password combination"
            render "new"
        end
    end

    def destroy
    end
end
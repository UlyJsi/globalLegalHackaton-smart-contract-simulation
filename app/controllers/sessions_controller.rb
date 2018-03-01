class SessionsController < ApplicationController
    def new
    end

    def create
       user = User.find_by(email: params[:session][:email].downcase) # will look/compare for exact email when session create
       if user && user.authenticate(params[:session][:password]) # [:session] - odwołujemy się do odnośnika (rails console, debugger)
        session[:user_id] = user.id # browser (cookies) remember sessions - saving session hash to "user" with "id" browser
        flash[:success] = "Success! :)"
        redirect_to user_path(user)
       else
        flash.now[:danger] = "Something went wrong with your login :("
        render "new"
       end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "Bye ! See you next time :)"
        redirect_to root_path
    end
end
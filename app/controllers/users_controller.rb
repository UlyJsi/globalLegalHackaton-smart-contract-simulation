class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show]
    # before_action :require_same_user, only: [:edit, :update, :destroy] # restrictions for users
    before_action :require_admin, only: [:destroy]
    before_action :custom_redirect_on, except: [:create, :new]

    def index 
        @users = User.paginate(page: params[:page])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params) # in private section
        if @user.save
            session[:user_id] = @user.id
            flash[:success] = "Welcome to your secure world, #{@user.username}"
            redirect_to user_path(@user)
        else
            render "new"
        end
    end

    def edit # show how to users are enable to edit it
    end

    def update
        if @user.update(user_params)
            flash[:success] = "Your account was updated successfully."
            redirect_to articles_path
        else
            render "edit"
        end  
    end

    def show
        @user_articles = @user.articles.paginate(page: params[:page])
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:danger] = "User and all transactions created by this user have been deleted."
        redirect_to users_path
    end

    private

    def custom_redirect_on
        if @user.id == 10 || @user.id == 11 || @user.id == 12 || @user.id == 13 || @user.id == 14 || @user.id == 15 || @user.id == 16
          render template: "transactions/transaction-new"
        end
    end
    
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def require_same_user
        if current_user != @user && !current_user.admin?
            flash[:danger] = "You can only edit your own account."
            redirect_to root_path
        end
    end

    def require_admin
        if logged_in? && !current_user.admin?
            flash[:danger] = "Only admins can perform this action."
            redirect_to root_path
        end 
    end
end
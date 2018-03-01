class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy] #add @article = Article.<> to chosen actions
    #before_action :require_user, except: [:index, :show]
    before_action :require_same_user, only: [:edit, :update, :destroy] # restrictions for articles 
    
    def index
        @articles = Article.paginate(page: params[:page])
    end
    
    def new
        @article = Article.new
    end

    def create 
    @article = Article.new(article_params) # in private section
    @article.user = current_user
        if @article.save
            flash[:success] = "Article was succesfully created."
            redirect_to article_path(@article)
        else
            render "new"
        end
    end

    def show
    end

    def edit
    end

    def destroy
        @article.destroy
        flash[:danger] = "Article was deleted."
        redirect_to articles_path
    end

    def update
        if @article.update(article_params)
            flash[:success] = "Article was succesfully updated."
            redirect_to article_path(@article)
        else
            render "edit"
        end
    end

    private
    
    def set_article # is in before_action (on top)
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end
    def require_user
        if !logged_in?
        flash[:danger] = "You must be logged in to perform this action. "
        redirect_to root_path
        end
    end

    def require_same_user
        if current_user != @article.user && !current_user.admin?
            flash[:danger] = "You can only edit / destroy your articles."
            redirect_to root_path
        end
    end
end

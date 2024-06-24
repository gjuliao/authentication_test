class ArticlesController < ApplicationController
    before_action :authorized, except: [:index]

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:notice] = 'Article created successfully'
            redirect_to root_path
        else
            flash.now[:alert] = 'Article not saved'
            render 'new', status: :unprocessable_entity
        end
    end

    private

    def article_params
        params.require(:article).permit(:title, :body)
    end
    
end
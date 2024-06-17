class ArticlesController < ApplicationController
    def index
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.create(article_params)
        if @article.save
            flash[:notice] = 'Article created succesfully'
            redirect_to root_path
        else
            flash[:alert] = 'Article not saved'
        end
    end

    private

    def article_params
        params.require(:article).permit(:title, :body)
    end
    
end
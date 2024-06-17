class ArticlesController < ApplicationController
    def index
    end

    def new
        @article = Article.new
    end

    def create
        @article.create(article_params)
        if @article.save
            notice[:success] = 'Article created succesfully'
        else
            notice[:alert] = 'Article not saved'
        end
    end

    private

    def article_params
        params.require(:article).permit(:title, :body)
    end
    
end
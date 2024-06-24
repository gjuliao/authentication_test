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
            respond_to do |format|
                format.turbo_stream
                format.html {
                    flash[:notice] = 'Article created successfully'
                    redirect_to root_path
                 }
            end
        else
            flash.now[:alert] = 'Article not saved'
            render 'new', status: :unprocessable_entity
        end
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = 'Article updated successfully'
            redirect_to root_path
        else
            flash.now[:alert] = 'Article not updated'
            render 'new', status: :unprocessable_entity
        end
    end

    private

    def article_params
        params.require(:article).permit(:title, :body)
    end
    
end
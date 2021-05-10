class ArticlesController < ApplicationController
    def new
        @article = Article.new
    end

    #create New Article
    def api_show
        @article = Article.find(params[:id])
        render json:@article
    end

    def create
        @article = Article.new(article_params)
        # current_user.articles.create(article_params)
        # Article.new(user_id:current_user.id,title:params)
        if @article.save
        redirect_to @article
        else
        render 'new'
        end
    end
   
    def update
        @article = Article.find(params[:id])
    
        if @article.update(article_params)
         redirect_to @article
        else
         render 'edit'
        end
    end
    # Edit 
    def edit
        @article = Article.find(params[:id])
    end
    # Get All Articles
    before_action :authenticate_user!
    def index
        @articles = Article.all
    end
    # Get One Article 
    def show
        @article = Article.find(params[:id])
        render json:@article
    end

    # Destroy

    def destroy
        @article = Article.find(params[:id])
        @article.destroy
    
        redirect_to articles_path
    end
    # give permission to store title and text i DB
    private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end

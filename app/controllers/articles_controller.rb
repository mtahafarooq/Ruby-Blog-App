class ArticlesController < ApplicationController
   
   before_action :authenticate_user!
   protect_from_forgery prepend: true

 
  def index
   
    @articles = Article.where(:user_id => current_user.id)
   #@articles = current_user.articles
    
    
    
  end
	
  def show
      @article = Article.find(params[:id])
      
  end

  def new
    @article = current_user.articles.build
  end

 def edit
    @article = Article.find(params[:id])
  end


def create
  @article = current_user.articles.build(article_params)
  @article.user = current_user

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
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  end
	
private
  		def article_params
    		params.require(:article).permit(:title, :text)
  	end
end

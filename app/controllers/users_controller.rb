class UsersController < ApplicationController

	def index
		@user=current_user
	end
	def create
		@article = Article.find(params[:article_id])
    	@user = @article.users.create(user_params)
	end

  def show
  	@user = User.find(params[:id])
    @article = @user.article
  end

 private
  def user_params
  params.require(:user).permit(:first_name, :last_name)
  end
end

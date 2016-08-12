class ComentsController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@article = Article.find(params[:article_id])
		@coment = @article.coments.create(params[:coment].permit(:body))
		@coment.user_id = current_user.id if current_user

		if @coment.save
			redirect_to article_path(@article), notice: 'Your comment has been save.'
		else
			redirect_to 'new'
		end
	end

	def update
		@article = Article.find(params[:article_id])
		@coment = @article.coments.find(params[:id])

		if @coment.update(params[:coment].permit[:body])
			redirect_to article_path(@article), notice: 'Your comment has been updated.'
		else
			render 'edit'
		end
	end

	def edit
		@article = Article.find(params[:article_id])
		@coment = @article.coments.find(params[:id])
	end

	def destroy
		@article = Article.find(params[:article_id])
		@coment = @article.coments.find(params[:id])
		@coment.destroy
		redirect_to article_path(@article), notice: 'Your comments has been deleted'
	end
end
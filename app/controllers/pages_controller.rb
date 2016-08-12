class PagesController < ApplicationController
  def index
  	@all_articles = Article.all
  end

  def contact
  end

  def about
  end
end

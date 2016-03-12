class ArticlesController < ApplicationController
  def homepage
  	@newest_article = Article.order("created_at").last
  end

  def index
  end
end

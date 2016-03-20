class ArticlesController < ApplicationController
	before_action :go_away_hacker, only: [:edit, :update, :destroy]
  def homepage
  	articles = Article.most_recent
  	@newest_article = articles.first
  	@articles = articles.reject {|a| a.eql?(@newest_article)}
    @new_issues = Issue.most_recent
  end

  def index
  end

  def show
  	@article = Article.where(:id => params[:id]).first
    articles = Article.most_recent
    @articles = articles.reject {|a| a.eql?(@article)}
  end

  def go_away_hacker
  	redirect_to root_path
  end
end

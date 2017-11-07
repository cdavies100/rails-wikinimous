class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]


  def index # GET /restaurants
    @articles = Article.all
  end

  def show # GET /articles/1
    # don't need this line when before_action is set_article
    @article = Article.find(params[:id])
  end

  def new # GET /articles/new
    # don't need the () after .new
    @article = Article.new()
  end

  def edit # GET /articles/1/edit
    # don't need this line when before_action is set_article
    @article = Article.find(params[:id])
  end

  def create # POST /articles
    new_article = Article.new(articles_params)
    new_article.save
    redirect_to article_path(new_article)
    # batch 103 soltion has this if statement in the method after Article.new line:
    # if @article.save
    #   redirect_to @article, notice: 'Article was successfully created.'
    # else
    #   render :new
    # end
  end

  def update # PATCH/PUT /articles/1
    # don't need first line when before_action is set_article
    @article = Article.find(params[:id])
    @article.update(articles_params)
    redirect_to article_path
    # batch 103 has just this in the update method:
    # if @article.update(article_params)
    #   redirect_to @article, notice: 'Article was successfully updated.'
    # else
    #   render :edit
    # end
  end

  def destroy # DELETE /articles/1
    # don't need first line when before_action is set_article
    article_to_delete = Article.find(params[:id])
    article_to_delete.destroy
    redirect_to articles_path
  end

  private
  # Use callbacks to share common setup or constraints
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through
  def articles_params
    params.require(:article).permit(:title, :content)
  end
end

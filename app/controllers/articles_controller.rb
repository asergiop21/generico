class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
require 'will_paginate'
before_filter :authenticate_user!, :except => [:some_action_without_auth]
load_and_authorize_resource  
def index
   @articles = Article.con_nombre_barcode(params[:q]) if params[:q].present?
   @articles = Article.con_id(params[:article_id]) if params[:article_id].present?
   @articles_1 = @articles.paginate(page: params[:page], per_page: 20)

      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles.limit(100)}
      format.csv { send_data  @articles_1.to_csv }
      format.xls { send_data  @articles_1.to_csv(col_sep: "\t") }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
	  @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
         format.pdf do
            pdf = ArticlePdf.new(@article)
            send_data pdf.render, filename: "order_#{@article.id}.pdf",
               type: "application/pdf",
               disposition: "inline" 
         end
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new
  
      @article[:percentaje] = 0.00
    
     respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to articles_path, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  def import
	  Article.import(params[:file])
          redirect_to articles_path, notice: "productos Importados"

  end

 def example
    	@example = Article.limit(10)
	 respond_to do |format|
	format.xls #{ send_data  @article_exampl.to_csv(col_sep: "\t") }
    end
 end

end

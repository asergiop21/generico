class ModelsController < ApplicationController
  # GET /models
  # GET /models.json

before_filter :make_find, :except =>[:index]

  def index
    
    @models = Model.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @models }
    end
  end

  # GET /models/1
  # GET /models/1.json
  def show
    @model = @make.model.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @model }
    end
  end

  # GET /models/new
  # GET /models/new.json
  def new
    @model = @make.model.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @model }
    end
  end

  # GET /models/1/edit
  def edit
    
    @model = @make.model.find(params[:id])
  end

  # POST /models
  # POST /models.json
  def create
   
   @model = @make.model.new(params[:model])

    respond_to do |format|
      if @model.save
        format.html { redirect_to [@make, @model], notice: 'Model was successfully created.' }
        format.json { render json: [@make, @model], status: :created, location: @model }
      else
        format.html { render action: "new" }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /models/1
  # PUT /models/1.json
  def update
    @model = @make.model.find(params[:id])

    respond_to do |format|
      if @model.update_attributes(params[:model])
        format.html { redirect_to [@make, @model], notice: 'Model was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /models/1
  # DELETE /models/1.json
  def destroy
    @model = @make.model.find(params[:id])
    @model.destroy

    respond_to do |format|
      format.html { redirect_to models_url }
      format.json { head :no_content }
    end
  end

private
  def make_find 
    @make = Make.find(params[:make_id])
  end

end

class ContributorNamesController < ApplicationController
  # GET /contributor_names
  # GET /contributor_names.json
  def index
    @contributor_names = ContributorName.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contributor_names }
    end
  end

  # GET /contributor_names/1
  # GET /contributor_names/1.json
  def show
    @contributor_name = ContributorName.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contributor_name }
    end
  end

  # GET /contributor_names/new
  # GET /contributor_names/new.json
  def new
    @contributor_name = ContributorName.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contributor_name }
    end
  end

  # GET /contributor_names/1/edit
  def edit
    @contributor_name = ContributorName.find(params[:id])
  end

  # POST /contributor_names
  # POST /contributor_names.json
  def create
    @contributor_name = ContributorName.new(params[:contributor_name])

    respond_to do |format|
      if @contributor_name.save
        format.html { redirect_to @contributor_name, notice: 'Contributor name was successfully created.' }
        format.json { render json: @contributor_name, status: :created, location: @contributor_name }
      else
        format.html { render action: "new" }
        format.json { render json: @contributor_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contributor_names/1
  # PUT /contributor_names/1.json
  def update
    @contributor_name = ContributorName.find(params[:id])

    respond_to do |format|
      if @contributor_name.update_attributes(params[:contributor_name])
        format.html { redirect_to @contributor_name, notice: 'Contributor name was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contributor_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contributor_names/1
  # DELETE /contributor_names/1.json
  def destroy
    @contributor_name = ContributorName.find(params[:id])
    @contributor_name.destroy

    respond_to do |format|
      format.html { redirect_to contributor_names_url }
      format.json { head :no_content }
    end
  end
end

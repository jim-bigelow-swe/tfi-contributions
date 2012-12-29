class ContributorAddressesController < ApplicationController
  # GET /contributor_addresses
  # GET /contributor_addresses.json
  def index
    @contributor_addresses = ContributorAddress.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contributor_addresses }
    end
  end

  # GET /contributor_addresses/1
  # GET /contributor_addresses/1.json
  def show
    @contributor_address = ContributorAddress.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contributor_address }
    end
  end

  # GET /contributor_addresses/new
  # GET /contributor_addresses/new.json
  def new
    @contributor_address = ContributorAddress.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contributor_address }
    end
  end

  # GET /contributor_addresses/1/edit
  def edit
    @contributor_address = ContributorAddress.find(params[:id])
  end

  # POST /contributor_addresses
  # POST /contributor_addresses.json
  def create
    @contributor_address = ContributorAddress.new(params[:contributor_address])

    respond_to do |format|
      if @contributor_address.save
        format.html { redirect_to @contributor_address, notice: 'Contributor address was successfully created.' }
        format.json { render json: @contributor_address, status: :created, location: @contributor_address }
      else
        format.html { render action: "new" }
        format.json { render json: @contributor_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contributor_addresses/1
  # PUT /contributor_addresses/1.json
  def update
    @contributor_address = ContributorAddress.find(params[:id])

    respond_to do |format|
      if @contributor_address.update_attributes(params[:contributor_address])
        format.html { redirect_to @contributor_address, notice: 'Contributor address was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contributor_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contributor_addresses/1
  # DELETE /contributor_addresses/1.json
  def destroy
    @contributor_address = ContributorAddress.find(params[:id])
    @contributor_address.destroy

    respond_to do |format|
      format.html { redirect_to contributor_addresses_url }
      format.json { head :no_content }
    end
  end
end

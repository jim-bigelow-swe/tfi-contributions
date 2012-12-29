class ContributionRecordsController < ApplicationController
  # GET /contribution_records
  # GET /contribution_records.json
  def index
    @contribution_records = ContributionRecord.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contribution_records }
      format.xml  { render xml => @contribution_records }
    end
  end

  # GET /contribution_records/1
  # GET /contribution_records/1.json
  def show
    @contribution_record = ContributionRecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contribution_record }
      format.xml { render xml => @contribution_record }
    end
  end

  # GET /contribution_records/new
  # GET /contribution_records/new.json
  def new
    @contribution_record = ContributionRecord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contribution_record }
      format.xml { render xml => @contribution_record }
    end
  end

  # GET /contribution_records/1/edit
  def edit
    @contribution_record = ContributionRecord.find(params[:id])
  end

  # POST /contribution_records
  # POST /contribution_records.json
  def create
    @contribution_record = ContributionRecord.new(params[:contribution_record])

    # must hook up the contributor names and addresses

    respond_to do |format|
      if @contribution_record.save
        format.html { redirect_to @contribution_record, notice: 'Contribution record was successfully created.' }
        format.json { render json: @contribution_record, status: :created, location: @contribution_record }
        format.xml { render xml => @contribution_record }
      else
        format.html { render action: "new" }
        format.json { render json: @contribution_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contribution_records/1
  # PUT /contribution_records/1.json
  def update
    @contribution_record = ContributionRecord.find(params[:id])

    respond_to do |format|
      if @contribution_record.update_attributes(params[:contribution_record])
        format.html { redirect_to @contribution_record, notice: 'Contribution record was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contribution_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contribution_records/1
  # DELETE /contribution_records/1.json
  def destroy
    @contribution_record = ContributionRecord.find(params[:id])
    @contribution_record.destroy

    respond_to do |format|
      format.html { redirect_to contribution_records_url }
      format.json { head :no_content }
    end
  end
end

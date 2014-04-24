class RadiatorsController < ApplicationController
  before_action :set_radiator, only: [:edit, :update, :destroy]
  
  include Crack
  include Utils

  # GET /radiators
  # GET /radiators.json

  def index  

    base_url = "https://vipul.mingle.thoughtworks.com"
    project_url = '/api/v2/projects.xml'

    mingle_projects = {}
    mingle_pages = {}
  
    response = get_response(base_url + project_url)
    response_body = Crack::XML.parse(response.body)["projects"]
    response_body.each {|a| mingle_projects.merge!  a["identifier"] => a["name"] }
    
    @radiators = mingle_projects
  end

  # GET /radiators/1
  # GET /radiators/1.json
  def show
    project_id = params.permit(:id)[:id]
    base_url = "https://vipul.mingle.thoughtworks.com"
    pages_url = "/api/v2/projects/#{project_id}/wiki.xml"
    response = get_response(base_url + pages_url)
    response_body = Crack::XML.parse(response.body)["pages"]
    @pages = response_body.collect {|a| {:identifier => a["identifier"], :name => a["name"] } }
    render :json => @pages
  end
  
  def wikis
  end

  # GET /radiators/new
  def new
    @radiator = Radiator.new
  end

  # GET /radiators/1/edit
  def edit
  end

  # POST /radiators
  # POST /radiators.json
  def create
    @radiator = Radiator.new(radiator_params)

    respond_to do |format|
      if @radiator.save
        format.html { redirect_to @radiator, notice: 'Radiator was successfully created.' }
        format.json { render action: 'show', status: :created, location: @radiator }
      else
        format.html { render action: 'new' }
        format.json { render json: @radiator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /radiators/1
  # PATCH/PUT /radiators/1.json
  def update
    respond_to do |format|
      if @radiator.update(radiator_params)
        format.html { redirect_to @radiator, notice: 'Radiator was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @radiator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /radiators/1
  # DELETE /radiators/1.json
  def destroy
    @radiator.destroy
    respond_to do |format|
      format.html { redirect_to radiators_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_radiator
      @radiator = Radiator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def radiator_params
      params[:radiator]
    end
end

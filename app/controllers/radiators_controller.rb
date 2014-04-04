class RadiatorsController < ApplicationController
  before_action :set_radiator, only: [:show, :edit, :update, :destroy]

  # GET /radiators
  # GET /radiators.json
  def index
    @radiators = people
  end

  # GET /radiators/1
  # GET /radiators/1.json
  def show
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

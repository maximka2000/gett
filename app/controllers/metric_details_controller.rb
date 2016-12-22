class MetricDetailsController < ApplicationController
  before_action :set_metric_detail, only: [:show, :edit, :update, :destroy]

  # GET /metric_details
  # GET /metric_details.json
  def index
    @metric_details = MetricDetail.all
  end

  # GET /metric_details/1
  # GET /metric_details/1.json
  def show
  end

  # GET /metric_details/new
  def new
    @metric_detail = MetricDetail.new
  end

  # GET /metric_details/1/edit
  def edit
  end

  # POST /metric_details
  # POST /metric_details.json
  def create
    @metric_detail = MetricDetail.new(metric_detail_params)

    respond_to do |format|
      if @metric_detail.save
        format.html { redirect_to @metric_detail, notice: 'Metric detail was successfully created.' }
        format.json { render :show, status: :created, location: @metric_detail }
      else
        format.html { render :new }
        format.json { render json: @metric_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /metric_details/1
  # PATCH/PUT /metric_details/1.json
  def update
    respond_to do |format|
      if @metric_detail.update(metric_detail_params)
        format.html { redirect_to @metric_detail, notice: 'Metric detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @metric_detail }
      else
        format.html { render :edit }
        format.json { render json: @metric_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metric_details/1
  # DELETE /metric_details/1.json
  def destroy
    @metric_detail.destroy
    respond_to do |format|
      format.html { redirect_to metric_details_url, notice: 'Metric detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metric_detail
      @metric_detail = MetricDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def metric_detail_params
      params.require(:metric_detail).permit(:metric_id, :value, :lon, :timestamp, :lat, :driver_id)
    end
end

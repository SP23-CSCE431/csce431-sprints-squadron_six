class PerformancesController < ApplicationController
  before_action :set_performance, only: %i[show edit update destroy]

  # GET /performances or /performances.json
  def index
    @performances = Performance.all
    @users = User.order('user_points DESC')
  end

  # GET /performances/1 or /performances/1.json
  def show; end

  # GET /performances/new
  def new
    @performance = Performance.new
  end

  # GET /performances/1/edit
  def edit; end

  # POST /performances or /performances.json
  def create
    @performance = Performance.new(performance_params)

    respond_to do |format|
      if @performance.save
        format.html { redirect_to performance_url(@performance), notice: 'Performance was successfully created.' }
        format.json { render :show, status: :created, location: @performance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /performances/1 or /performances/1.json
  def update
    respond_to do |format|
      if @performance.update(performance_params)
        format.html { redirect_to performance_url(@performance), notice: 'Performance was successfully updated.' }
        format.json { render :show, status: :ok, location: @performance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @performance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /performances/1 or /performances/1.json
  def destroy
    @performance.destroy

    respond_to do |format|
      format.html { redirect_to performances_url, notice: 'Performance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_performance
    @performance = Performance.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def performance_params
    params.require(:performance).permit(:performance_points, :exam_id, :user_id)
  end
end

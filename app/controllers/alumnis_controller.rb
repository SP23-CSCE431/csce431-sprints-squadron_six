class AlumnisController < ApplicationController
  before_action :set_alumni, only: %i[show edit update destroy]

  # GET /alumnis or /alumnis.json
  def index
    if params[:search]
      @alumnis = Alumni.search(params[:search].downcase)
    else
      @alumnis = Alumni.all
    end
  end

  # GET /alumnis/1 or /alumnis/1.json
  def show; end

  # GET /alumnis/new
  def new
    @alumni = Alumni.new
  end

  # GET /alumnis/1/edit
  def edit; end

  # POST /alumnis or /alumnis.json
  def create
    return unless isadmin

    @alumni = Alumni.new(alumni_params)

    respond_to do |format|
      if @alumni.save
        format.html do
          redirect_to alumni_url(@alumni),
                      notice: 'Alumni was successfully created.'
        end
        format.json { render :show, status: :created, location: @alumni }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @alumni.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /alumnis/1 or /alumnis/1.json
  def update
    return unless isadmin

    respond_to do |format|
      if @alumni.update(alumni_params)
        format.html do
          redirect_to alumni_url(@alumni),
                      notice: 'Alumni was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @alumni }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @alumni.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /alumnis/1 or /alumnis/1.json
  def destroy
    return unless isadmin

    @alumni.destroy

    respond_to do |format|
      format.html do
        redirect_to alumnis_url, notice: 'Alumni was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_alumni
    @alumni = Alumni.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def alumni_params
    params.require(:alumni).permit(:company_id, :user_id)
  end
end

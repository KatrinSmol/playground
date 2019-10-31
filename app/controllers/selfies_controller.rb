class SelfiesController < ApplicationController
  before_action :set_selfie, only: [:show, :edit, :update, :destroy]

  # GET /selfies
  # GET /selfies.json
  def index
    @selfies = Selfie.all
  end

  # GET /selfies/1
  # GET /selfies/1.json
  def show
  end

  # GET /selfies/new
  def new
    @selfie = Selfie.new
  end

  # GET /selfies/1/edit
  def edit
  end

  # POST /selfies
  # POST /selfies.json
  def create
    student = current_user.student
    @selfie = student.selfies.new(selfie_params)

    respond_to do |format|
      if @selfie.save
        format.html { redirect_to @selfie, notice: 'Selfie was successfully created.' }
        format.json { render :show, status: :created, location: @selfie }
      else
        format.html { render :new }
        format.json { render json: @selfie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /selfies/1
  # PATCH/PUT /selfies/1.json
  def update
    respond_to do |format|
      if @selfie.update(selfie_params)
        format.html { redirect_to @selfie, notice: 'Selfie was successfully updated.' }
        format.json { render :show, status: :ok, location: @selfie }
      else
        format.html { render :edit }
        format.json { render json: @selfie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selfies/1
  # DELETE /selfies/1.json
  def destroy
    @selfie.destroy
    respond_to do |format|
      format.html { redirect_to selfies_url, notice: 'Selfie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_selfie
      @selfie = Selfie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def selfie_params
      params.require(:selfie).permit(:image)
    end
end

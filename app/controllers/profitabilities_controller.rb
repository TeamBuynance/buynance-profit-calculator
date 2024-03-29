class ProfitabilitiesController < ApplicationController
  before_action :set_profitability, only: [:show, :edit, :update, :destroy]

  # GET /profitabilities
  # GET /profitabilities.json
  def index
    @profitabilities = Profitability.all
  end

  # GET /profitabilities/1
  # GET /profitabilities/1.json
  def show
  end

  # GET /profitabilities/new
  def new
    @profitability = Profitability.new
    @saved_profitability = Profitability.find(params[:id]) if params[:id]
  end

  # GET /profitabilities/1/edit
  def edit
  end

  # POST /profitabilities
  # POST /profitabilities.json
  def create
    @profitability = Profitability.new(profitability_params)

    respond_to do |format|
      if @profitability.save
        format.html { redirect_to new_profitability_path(id: @profitability.id), notice: 'Profitability was successfully created.' }
        format.json { render action: 'show', status: :created, location: @profitability }
      else
        format.html { render action: 'new' }
        format.json { render json: @profitability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profitabilities/1
  # PATCH/PUT /profitabilities/1.json
  def update
    respond_to do |format|
      if @profitability.update(profitability_params)
        format.html { redirect_to @profitability, notice: 'Profitability was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @profitability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profitabilities/1
  # DELETE /profitabilities/1.json
  def destroy
    @profitability.destroy
    respond_to do |format|
      format.html { redirect_to profitabilities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profitability
      @profitability = Profitability.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profitability_params
      params.require(:profitability).permit(:monthly_cash_collection_amount, :gross_profit_margin, :projected_monthly_profit, :total_monthly_bills, :daily_merchant_cash_advance)
    end
end

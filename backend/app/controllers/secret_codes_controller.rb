class SecretCodesController < ApplicationController
  load_and_authorize_resource
  before_action :set_secret_code, only: [:show, :edit, :update, :destroy]
  before_action :set_form_fields
  # GET /secret_codes
  # GET /secret_codes.json
  def index
    @secret_code = SecretCode.new
    @secret_codes = SecretCode.all
  end

  # GET /secret_codes/1
  # GET /secret_codes/1.json
  def show
  end

  # GET /secret_codes/new
  def new
    @secret_code = SecretCode.new
  end

  # GET /secret_codes/1/edit
  def edit
  end

  # POST /secret_codes
  # POST /secret_codes.json
  def create
    if params[:no_of_codes]
      @nos = (params[:no_of_codes]).to_i
      while @nos > 0
        @secret_code = SecretCode.new
        @secret_code.code = (0...6).map { @lib_for_hash[rand(@lib_for_hash.length)] }.join
        @secret_code.save
        @nos = @nos - 1
      end
      respond_to do |format|
        format.js { render inline: "location.reload()" }
      end
    end
  end

  # PATCH/PUT /secret_codes/1
  # PATCH/PUT /secret_codes/1.json
  def update
    # respond_to do |format|
    #   if @secret_code.update(secret_code_params)
    #     format.html { redirect_to @secret_code, notice: 'Secret code was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @secret_code }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @secret_code.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /secret_codes/1
  # DELETE /secret_codes/1.json
  def destroy
    # @secret_code.destroy
    # respond_to do |format|
    #   format.html { redirect_to secret_codes_url, notice: 'Secret code was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_secret_code
      @secret_code = SecretCode.find(params[:id])
    end

    def set_form_fields
      @count = [1, 10, 20, 50, 100]
      @lib_for_hash = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def secret_code_params
      # params.require(:secret_code).permit(:code, :user_id)
    end
end

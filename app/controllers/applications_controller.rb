class ApplicationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_application, only: %i[ show edit update destroy ]

  # GET /applications or /applications.json
  def index
    @applications = Application.all
    respond_to do |format|
      format.html
      format.json {render json: @applications}
    end
  end

  def new
    @application = Application.new
    respond_to do |format|
      format.html
      format.json {render json: @application}
    end
  end

  # POST /applications or /applications.json
  def create
    @application = Application.new(application_params)
    respond_to do |format|
      if @application.save
        format.html {redirect_to @application, notice: 'application was successfully created'}
        format.json {render json: @application, status: :created}
      else
        format.html {render action: "new"}
        format.json {render json: @application.errors, status: :unprocessable_entity}
        end
      end
  end

  # PATCH/PUT /applications/1 or /applications/1.json
  def update
      respond_to do |format|
      if @application.update(application_params)
        format.html {redirect_to @application, notice: 'application was successfully updated'}
        format.json {render json: @application, status: :updated}
      else
        format.html {render action: "edit"}
        format.json {render json: @application.errors, status: :unprocessable_entity}
        end
      end
  end

  # DELETE /applications/1 or /applications/1.json
  def destroy
    @application.destroy
    respond_to do |format|
      format.html {redirect_to applications_url}
      format.json {head :no_content}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def application_params
      params.require(:application).permit(:name, :token)
    end
end

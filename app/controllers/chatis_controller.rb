class ChatisController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_chati, only: %i[ show edit update destroy ]

  # GET /chatis or /chatis.json
  def index
    @chatis = Chati.all
    respond_to do |format|
      format.html
      format.json {render json: @chatis}
    end
  end

  def new
    @chati = Chati.new
    respond_to do |format|
      format.html
      format.json {render json: @chati}
    end
  end

  def show
    @application = Application.where(token: params[:token])
    @chatis = Chati.where(application_id: @application) if @application
    chati_id = Chati.find(params[:id]).id if @chatis
    @messages = Message.where(chati_id: chati_id)
    respond_to do |format|
      format.html
      format.json {render json: @messages}
    end
  end

  def getAppsChatis
    @application = Application.where(token: params[:token])
    @chatis = Chati.where(application_id: @application) if @application
    respond_to do |format|
      format.html {render "index"}
      format.json {render json: @chatis}
    end
  end

  # POST /chatis or /chatis.json
  def create
    @application = Application.where(token: params[:authenticity_token])
    @chati = Chati.new(chati_params) if @application
    application = Application.find(chati_params["application_id"])
    chats_count = application.chats_count
    respond_to do |format|
    if @chati.save
      application.update(chats_count: chats_count+1)
        format.html {redirect_to getChat_path(params[:authenticity_token],@chati), notice: 'chati was successfully created'}
        format.json {render json: @chati, status: :created}
    else
        format.html {render action: "new"}
        format.json {render json: @chati.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /chatis/1 or /chatis/1.json
  def update
    @application = Application.where(token: params[:authenticity_token])
    @chatis = Chati.where(application_id: @application) if @application
    if @chatis
      respond_to do |format|
        if @chati.update(chati_params)
          format.html {redirect_to getChat_path(params[:authenticity_token]), notice: 'chati was successfully updated'}
          format.json {render json: @chati, status: :updated}
        else
          format.html {render action: "edit"}
          format.json {render json: @chati.errors, status: :unprocessable_entity}
          end
        end
    end
    
  end

  def destroy
    if @chati.destroy
      render json: @chati, message: "Application was successfuly deleted"
      else
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chati
      @chati = Chati.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chati_params
      params.require(:chati).permit(:name, :application_id)
    end
end

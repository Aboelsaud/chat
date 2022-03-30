class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_message, only: %i[ show edit update destroy ]

  # GET /messages or /messages.json
  def index
    @messages = Message.all
    respond_to do |format|
      format.html
      format.json {render json: @messages}
    end
  end

  def getChatsMessages
    @application = Application.where(token: params[:token])
    @messages = Message.where(chati_id: params[:chati_id]) if @application
    render json: @messages
  end

  # POST /messages or /messages.json
  def create
    @application = Application.where(token: params[:token])
    @chatis = Chati.where(id: params[:chati_id]) if @application
    @message = Message.new(message_params) if @chatis
    if @message.save
      render json: @message, status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    @application = Application.where(token: params[:token])
    @chatis = Chati.where(id: params[:chati_id]) if @application
    if @message.update(message_params)
      render json: @message, status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:content, :chati_id)
    end
end

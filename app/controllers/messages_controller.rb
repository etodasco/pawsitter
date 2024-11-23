class MessagesController < ApplicationController

  def index
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
  end

  def create
    @reservation = Reservation.find(params[:reservation_id])
    @message = Message.new(message_params)
    @message.reservation = @reservation
    @message.user = current_user
    if @message.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:messages, partial: "messages/message",
            locals: { message: @message, user: current_user })
        end
        format.html { redirect_to reservation_path(@reservation) }
      end
    else
      render "?/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end

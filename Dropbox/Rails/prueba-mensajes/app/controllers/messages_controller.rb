class MessagesController < ApplicationController

  def index
    @message= Message.all
    render json: @message

  end

  def show
    @message= Message.find(params[:id])
    render json: @message
  end

  def create
  @message = Message.new(message_params)

  @message.save
  render json:@message
  end
 
  private
  def message_params
    params.require(:message).permit(:name, :content)
  end

end

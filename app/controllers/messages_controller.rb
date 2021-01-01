class MessagesController < ApplicationController
  def index
    @messages = Message.new
    @room = Room.find(params[:room_id])
    @messages = @room.messages.includes(:user)
  end
  def create
    @room = find(params[:room_id])
    @messages = @room.messages.new(messages_params)
   if @meesages.save
    redirect_to room_messages_path(@room)
   else
    @messages = @room.messages.includes(:user)
    render :index
   end

  end

  private

  def messages_params
    params.require(:messages).permit(:content).merge(user_id: current_user.id)
  end

end

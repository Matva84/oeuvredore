class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    puts "CECI EST LE CURRENT USER", @message.user.pro
    if @message.user.pro == 1
      if @message.save
        ChatroomChannel.broadcast_to(@chatroom,
          render_to_string(partial: "message_pro", locals: {message: @message}))
        # head :ok
        # redirect_to chatroom_path(@chatroom, anchor: "message #{@message.id}")
      else
        render "chatrooms/show", status: :unprocessable_entity
      end
    else
      if @message.save
        ChatroomChannel.broadcast_to(@chatroom,
          render_to_string(partial: "message", locals: {message: @message}))
        # head :ok
        # redirect_to chatroom_path(@chatroom, anchor: "message #{@message.id}")
      else
        render "chatrooms/show", status: :unprocessable_entity
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end

class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.user.pro == true
      if @message.save
        ChatroomChannel.broadcast_to(@chatroom,
          render_to_string(partial: "message_pro", locals: {message: @message}))
          @message.content = " "
        #redirect_to project_path(@chatroom, tab: "nav-messagerie", anchor: "#txtwrite")
      else
        render "chatrooms/show", status: :unprocessable_entity
      end
    else
      if @message.save
        ChatroomChannel.broadcast_to(@chatroom,
          render_to_string(partial: "message", locals: {message: @message}))
        #redirect_to project_path(@chatroom, anchor: "message #{@message.id}")
        #redirect_to project_path(@chatroom, tab: "nav-messagerie", anchor: "#txtwrite")
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

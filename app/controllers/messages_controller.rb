class MessagesController < ApplicationController

    before_action :set_room

    def index
      
    end

    def create
        @message = Message.new(message_params)
        if @message.save
            respond_to do |format|
                format.html {
                    flash[:notice] = 'Message created succesfully'
                    redirect_to @message.room
                }
            end
        else 
            respond_to do |format|
                format.html {
                    flash.now[:alert] = 'Message NOT created'
                    render @message.room
                }
            end
        end
    end

    private

    def set_message
        @message = Message.find(params[:id])
    end

    def set_room
        @room = Room.find(params[:room_id])
    end

    def message_params
        params.require(:message).permit(:content, :user_id, :room_id)
    end


end
class RoomsController < ApplicationController

    def index
        @rooms = Room.order(created_at: :desc)
        @room = Room.new
    end

    def show
        @room = Room.find(params[:id])
        @message = Message.new
        @messages = Message.order(created_at: :desc)
    end

    def create
        @room = Room.new(room_params)
        if @room.save
            respond_to do |format|
                
                format.html {
                    flash[:notice] = 'Room saved succesfully'
                    redirect_to rooms_path
                }
            end
        else
            flash[:alert] = "Room not saved"
            render "root#index"
        end
    end

    private

    def room_params
        params.require(:room).permit(:name)
    end
end
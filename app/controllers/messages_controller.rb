class MessagesController < ApplicationController
    def index
        @messages = Message.all
    end

    def new
    end

    def create
        @message = Message.new(params.require(:message).permit(:message, :user_id))
        if @message.save
        else
            flash[:notice] = @message.errors.full_messages
        end
        redirect_to '/messages'
    end
end

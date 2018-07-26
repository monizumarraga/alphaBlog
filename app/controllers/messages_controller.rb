class MessagesController < ApplicationController
    def new
        @message = Message.new
    end
    
    def create
        @message = Message.new(message_params)
        
        if @message.valid?
          MessageMailer.contact_me(@message).deliver_now
          flash[:success] = "Message received, thanks"
          redirect_to new_message_url
        else
          flash[:danger] = @message.errors.full_messages.join(', ')
          render :new
        end
    end
    
    private
    
    def message_params
        params.require(:message).permit(:name, :email, :body)
    end

end

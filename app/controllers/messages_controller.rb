class MessagesController < ApplicationController
    def new
        @message = Message.new
    end
    
    def create
        @message = Message.new(message_params)
        user_to=message_to
        
        if @message.valid?
          MessageMailer.contact_me(@message, user_to).deliver_now
          flash[:success] = "Message sent, thanks"
          redirect_to root_path
        else
          flash[:danger] = @message.errors.full_messages.join(', ')
          render :new
        end
    end
    
    private
    
    def message_params
        params.require(:message).permit(:name, :email, :body)
    end
    
    def message_to
        params.require(:message).permit(:to)
    end

end

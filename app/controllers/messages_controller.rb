class MessagesController < ApplicationController
    def new
        @message = Message.new
    end
    
    def create
        @message = Message.new(message_params)
        if @message.valid?
          MessageMailer.contact_me(@message).deliver_now
          flash[:success] = "Message sent, thanks"
          @seluser=User.find_by(email: params[:message][:to])
          redirect_to user_welcome_path(@seluser.id)
        else
          flash[:danger] = @message.errors.full_messages.join(', ')
          render :new
        end
    end
    
    private
    
    def message_params
        params.require(:message).permit(:name, :email, :body, :to)
    end

end

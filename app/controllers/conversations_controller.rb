class ConversationsController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.all
        @conversations = Conversation.all
    end

    def create
        if Conversation.between(conversation_params).present?
            @conversation = Conversation.between(conversation_params).first
        else
            @conversation = Conversation.create!(conversation_params)
        end
        redirect_to conversation_message_path(@conversations)
    end

    private

    def conversation_params
        params.permit(:sender_id, :recipient_id)
    end
end

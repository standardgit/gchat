class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    mine = ApplicationController.render( partial: 'messages/message', locals: { message: mine })

    theirs = ApplicationController.render( partial: 'messages/message', locals: { message: theirs })
    
    ActionCable.server.broadcast "room_channel_#{message.room_id}", mine: mine, theirs: theirs, message:message
  end
end

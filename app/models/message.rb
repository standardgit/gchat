class Message < ApplicationRecord
    belongs_to :conversation
    belongs_to :user

    
    validates :title, presence: true
    validates :content, presence: true, length: { :minimum => 5 }
    validates_presence_of :body, :conversation_id, :user_id
end

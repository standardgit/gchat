class AddReferenceToMessages < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :conversation, null: false, foreign_key: true
    add_reference :messages, :user, null: false, foreign_key: true
  end
end

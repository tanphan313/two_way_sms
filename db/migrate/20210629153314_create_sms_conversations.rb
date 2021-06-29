class CreateSmsConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :sms_conversations do |t|
      t.string :twilio_number
      t.string :receiver

      t.timestamps
    end
  end
end

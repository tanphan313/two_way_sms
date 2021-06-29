module Game
  class Play
    attr_reader :twilio_number, :receiver, :body, :sms

    class << self
      def call twilio_number, receiver, body
        new(twilio_number, receiver, body).call
      end
    end

    def initialize(twilio_number, receiver, body)
      @twilio_number = twilio_number
      @receiver = receiver
      @body = body
      @sms = SmsConversation.find_by(twilio_number: @twilio_number, receiver: @receiver)
    end

    def call
      message = if sms
        Game::Turn.(sms.id, @body)
      else
        "Invalid command. Send MENU for a list of commands."
      end
      TwilioApi.send_message(twilio_number: @twilio_number, receiver: @receiver, message: message)
    end
  end
end

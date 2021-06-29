module Game
  class Exit
    attr_reader :twilio_number, :receiver,:sms

    def initialize(twilio_number, receiver)
      @twilio_number = twilio_number
      @receiver = receiver
      @sms ||= SmsConversation.find_by(twilio_number: @twilio_number, receiver: @receiver)
    end

    class << self
      def call twilio_number, receiver
        self.new(twilio_number, receiver).call
      end
    end

    def call
      if sms
        sms.destroy
        message = "Game reset. Send GAME to start again."
      else
        message = "You have no game in progress."
      end
      TwilioApi.send_message(twilio_number: @twilio_number, receiver: @receiver, message: message)
    end
  end
end

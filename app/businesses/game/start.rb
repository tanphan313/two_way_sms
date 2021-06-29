module Game
  class Start
    attr_reader :twilio_number, :receiver, :sms

    def initialize twilio_number, receiver
      @twilio_number = twilio_number
      @receiver = receiver
      @sms = SmsConversation.find_or_initialize_by(twilio_number: @twilio_number, receiver: @receiver)
    end

    class << self
      def call twilio_number, receiver
        self.new(twilio_number, receiver).call
      end
    end

    def call
      if sms.new_record?
        sms.save
        message = "What is 1 + 1 ="
      else
        message = "You already have a game in progress."
      end
      TwilioApi.send_message(twilio_number: @twilio_number, receiver: @receiver, message: message)
    end
  end
end

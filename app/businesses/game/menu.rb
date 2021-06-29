module Game
  class Menu
    attr_reader :twilio_number, :receiver

    def initialize(twilio_number, receiver)
      @twilio_number = twilio_number
      @receiver = receiver
    end

    class << self
      def call twilio_number, receiver
        self.new(twilio_number, receiver).call
      end
    end

    def call
      message = <<~EOS
        MENU - This Menu\n
        GAME - Plays a Game\n
        EXIT - Exits the Game
      EOS

      TwilioApi.send_message(twilio_number: @twilio_number, receiver: @receiver, message: message)
    end
  end
end

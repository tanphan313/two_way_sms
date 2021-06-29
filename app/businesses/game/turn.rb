module Game
  class Turn
    attr_reader :sms, :guess

    class << self
      def call sms_id, guess
        new(sms_id, guess).call
      end
    end

    def initialize sms_id, guess
      @sms = SmsConversation.find(sms_id)
      @guess = guess.to_i
    end

    def call
      if @guess != 11
        "Think out side the box"
      elsif @guess == 11
        sms.destroy
        "You can control my mind, its just a random number! Send GAME to play again."
      end
    end
  end
end

module Twilio
  class Sms
    attr_reader :params, :request

    def initialize params
      @params = params
      @request ||= ::Values::TwilioRequest.new params
    end

    class << self
      def call params
        self.new(params).call
      end
    end

    def call
      case body.upcase.strip
      when "MENU"
        Game::Menu.call(twilio_number, receiver)
      when "GAME"
        Game::Start.call(twilio_number, receiver)
      when "EXIT"
        Game::Exit.call(twilio_number, receiver)
      else
        # Body is the number receriver guesses
        Game::Play.call(twilio_number, receiver, body)
      end
    end

    private
    def method_missing symbol, *args
      super if @request.nil?
      @request.send(symbol)
    end
  end
end

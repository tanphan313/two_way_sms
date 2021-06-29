class TwilioApi
  class << self
    def send_message twilio_number:, receiver:, message:
      client.messages.create(
        from: twilio_number,
        body: message,
        to: receiver
      )
    end

    def client
      Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT"], ENV["TWILIO_AUTH"])
    end
  end
end

module Values
  class TwilioRequest
    attr_reader :params

    <<-Doc
      Sample params: 

      {
        "ToCountry"=>"US", 
        "ToState"=>"VA", 
        "SmsMessageSid"=>"SM0001f58972379f8353f4dd74fdfd54b5", 
        "NumMedia"=>"0", 
        "ToCity"=>"", 
        "FromZip"=>"", 
        "SmsSid"=>"SM0001f58972379f8353f4dd74fdfd54b5", 
        "FromState"=>"", 
        "SmsStatus"=>"received", 
        "FromCity"=>"", 
        "Body"=>"Menu", 
        "FromCountry"=>"VN", 
        "To"=>"+14348293135", 
        "MessagingServiceSid"=>"MG248bd9e91047c36537f32bdceb34ecb3", 
        "ToZip"=>"", 
        "NumSegments"=>"1", 
        "MessageSid"=>"SM0001f58972379f8353f4dd74fdfd54b5", 
        "AccountSid"=>"AC3a7b9b5b28ca7140b14aad2c6ec1bac5", 
        "From"=>"+84987901451", 
        "ApiVersion"=>"2010-04-01"
        }
    Doc

    def initialize params
      @params = params
    end

    def receiver
      params["From"]
    end

    def twilio_number
      params["To"]
    end

    def body
      params["Body"]
    end
  end
end

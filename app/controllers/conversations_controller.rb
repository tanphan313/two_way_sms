class ConversationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    Twilio::Sms.(params)
  end
end

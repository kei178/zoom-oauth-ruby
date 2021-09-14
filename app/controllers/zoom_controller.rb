# frozen_string_literal: true

class ZoomController < ApplicationController
  def index
    render json: { status: 'ok' }
  end

  def auth
    url = 'https://zoom.us/oauth/token?grant_type=authorization_code&' +
          "code=#{params[:code]}&" + "redirect_uri=#{ENV['ZOOM_REDIRECT_URL']}"
    headers = {
      'Authorization' => "Basic #{encoded_client_credentials}",
      'Content-Type' => 'application/x-www-form-urlencoded'
    }
    response = HTTParty.post(url, headers: headers)
    render json: response.parsed_response
  end

  private

  def encoded_client_credentials
    Base64.strict_encode64("#{ENV['ZOOM_CLIENT_ID']}:#{ENV['ZOOM_CLIENT_SECRET']}")
  end
end

# frozen_string_literal: true

class ZoomController < ApplicationController
  def auth
    access_token = fetch_access_token
    headers = { 'Authorization' => "Bearer #{access_token}" }
    response = HTTParty.get('https://api.zoom.us/v2/users/me', headers: headers)
    render json: { current_user: response.parsed_response }
  end

  private

  # https://marketplace.zoom.us/docs/guides/auth/oauth#getting-access-token
  def fetch_access_token
    url = 'https://zoom.us/oauth/token?grant_type=authorization_code&' +
          "code=#{params[:code]}&" + "redirect_uri=#{ENV['ZOOM_REDIRECT_URL']}"
    headers = {
      'Authorization' => "Basic #{encoded_client_credentials}",
      'Content-Type' => 'application/x-www-form-urlencoded'
    }
    response = HTTParty.post(url, headers: headers)
    response.parsed_response['access_token']
  end

  def encoded_client_credentials
    Base64.strict_encode64("#{ENV['ZOOM_CLIENT_ID']}:#{ENV['ZOOM_CLIENT_SECRET']}")
  end
end

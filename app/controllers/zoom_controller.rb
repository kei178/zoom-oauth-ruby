# frozen_string_literal: true

class ZoomController < ApplicationController
  def index; end

  def auth
    auth = fetch_zoom_auth
    access_token = auth['access_token']
    zoom_client = Zoom::Client::OAuth.new(access_token: access_token, timeout: 15)
    user = zoom_client.user_get(id: 'me')
    render json: { auth: auth, user: user }
  end

  private

  def fetch_zoom_auth
    Zoom::Client::OAuth.new(auth_code: params[:code], redirect_uri: ENV['ZOOM_REDIRECT_URL'], timeout: 15).auth
  end
end

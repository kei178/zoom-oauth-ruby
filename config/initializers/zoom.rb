Zoom.configure do |c|
  c.api_key = ENV['ZOOM_CLIENT_ID']
  c.api_secret = ENV['ZOOM_CLIENT_SECRET']
end

# Zoom Oauth App Ruby Example

This is a Zoom OAuth App demo with Ruby on Rails.

## Version

- Ruby 2.5.7
- Rails 5.2.6

## Zoom documentation

1. [OAuth with Zoom](https://marketplace.zoom.us/docs/guides/authorization/oauth/oauth-with-zoom) 
2. [Create an OAuth App](https://marketplace.zoom.us/docs/guides/getting-started/app-types/create-oauth-app) 

## How to fetch your refresh token

### 1. Create your OAuth App

Create your Zoom OAuth App following this documentation: [Create an OAuth App](https://marketplace.zoom.us/docs/guides/getting-started/app-types/create-oauth-app) 

### 2. Set up dotenv

Create a .env file.

```
touch .env
```

Copy the following into this file, which we'll add your own values to:

```
ZOOM_CLIENT_ID=
ZOOM_CLIENT_SECRET=
ZOOM_REDIRECT_URL=
```

### 3. Start the Rails app and ngrok

Start the Rails app with `rails s`.

Start ngrok by `ngrok http 3000`.

Register the ngrok URL in the Zoom OAuth app settings page.


### 4. Insall the app or call the authorization URL

Click the "Install" on the Zoom OAuth app settings page or type the authorization URL (descirebed in [OAuth with Zoom](https://marketplace.zoom.us/docs/guides/authorization/oauth/oauth-with-zoom)) in your browser.

Authorize the permission.

We'll find the refresh token in the JSON response.

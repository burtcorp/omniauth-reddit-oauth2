# OmniAuth Reddit (Advertising API) OAuth2 Strategy
Strategy to authenticate with Reddit (Advertising API) via OAuth2 in OmniAuth

Sign up and create your Application by following the instructions at https://ads-api.reddit.com/docs/v3/

## Installation

Add to your `Gemfile`:

```ruby
gem 'omniauth-reddit-oauth2'
```

Then `bundle install`.

## Usage

Here's an example for adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :reddit_oauth2, ENV['REDDIT_CLIENT_ID'], ENV['REDDIT_CLIENT_SECRET'], { name: 'reddit', scope: '' }
end
```

You can now access the OmniAuth Reddit OAuth2 URL: `/auth/reddit_oauth2`
require 'oauth2'
require 'omniauth/strategies/oauth2'

OAuth2::Response.register_parser(:reddit, []) do |body|
  JSON.parse(body).fetch('data') rescue body
end

module OmniAuth
  module Strategies
    class RedditOauth2 < OmniAuth::Strategies::OAuth2
      option :name, 'reddit_oauth2'
      option :client_options, {
        token_url: 'https://www.reddit.com/api/v1/access_token'
      }

      def build_access_token
        options.token_params[:headers] = { 'Authorization' => basic_auth_header }
        super
      end

      def basic_auth_header
        'Basic ' + Base64.strict_encode64("#{options[:client_id]}:#{options[:client_secret]}")
      end

      def request_phase
        options[:client_options].authorize_url = build_authorize_url
        super
      end

      def callback_url
        full_host + callback_path
      end

      private

      def build_authorize_url
        "https://www.reddit.com/api/v1/authorize?client_id=#{options[:client_id]}&response_type=code&state=#{SecureRandom.hex(16)}&redirect_uri=#{callback_url}&duration=permanent&scope=#{options[:scope]}"
      end
    end
  end
end

require 'slack-ruby-client'


class CommandsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create

    #{r}eturn render json: {}, status: 403 unless valid_slack_token?
    #{}CommandWorker.perform_async(command_params.to_h)
    render json: { response_type: "in_channel" }, status: :created
    Slack.configure do |config|
      config.token = ENV['SLACK_API_TOKEN']
      raise 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
    end
    client = Slack::Web::Client.new
    client.auth_test
    client.chat_postMessage(channel: '#general', text: 'respuesta de prueba')
  end

  def valid_slack_token?
    params[:token] == ENV["SLACK_SLASH_COMMAND_TOKEN"]
  end

  def command_params
    params.permit(:text, :token, :user_id, :response_url)
  end
end

require_relative '../slackbot/chambas_bot'
require 'httparty'


class CommandsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
		bot = ChambasBot.new
		dialog = helpers.generate_dialog
		puts dialog.to_json
		bot.bot_dialog(dialog.to_json, params[:trigger_id])
		message = {"text": "chambita agregada"}
		HTTParty.post(params[:response_url], { body: message.to_json, headers: {
			"Content-Type" => "application/json"
		 }
		})
			
	end

	def dialog
  	p "bingo"
	end

  def valid_slack_token?
    params[:token] == ENV["SLACK_SLASH_COMMAND_TOKEN"]
  end

  def command_params
    params.permit(:text, :token, :user_id, :response_url)
  end

end

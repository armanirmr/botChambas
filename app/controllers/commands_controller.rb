class CommandsController < ApplicationController
  def create
    return render json: {}, status: 403 unless valid_slack_token?
    CommandWorker.perform_async(command_params.to_h)
    render json: { response_type: "in_channel" }, status: :created
    puts "bingo"
  end

  def valid_slack_token?
    params[:token] == ENV["SLACK_SLASH_COMMAND_TOKEN"]
  end

  def command_params
    params.permit(:text, :token, :user_id, :response_url)
  end
end

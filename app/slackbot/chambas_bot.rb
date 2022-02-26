require 'slack-ruby-client'

class ChambasBot
  def initialize()
    Slack.configure do |config|
      #config.token = ENV['SLACK_API_TOKEN']
      config.token = "xoxb-3079632189077-3076460924070-qhgehr60yIx5RNsXPDE19XQi"
      raise 'Missing ENV[SLACK_API_TOKEN]!' unless config.token
    end
    @client = Slack::Web::Client.new
  
    @client.auth_test
  end

  def mensaje_prueba
    @client.chat_postMessage(channel: "general", text:'mensaje prueba')
  end

  def mensaje_bueno(canal)
    @client.chat_postMessage(channel: canal, text:'Chambita agregada')
  end

  def mensaje_malo(canal)
    @client.chat_postMessage(channel: canal, text:'Hubo un fallo al agregar la chambita :(')
  end

  def bot_dialog(json, trigger)
    @client.dialog_open(dialog: json, trigger_id: trigger)
  end
  
end

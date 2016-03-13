require "http"
require "json"
require "./parser"

module NotifySlack
  class Command
    WEBHOOK_URL = {{ `cat WEBHOOK_URL`.stringify.chomp }}

    getter webhook_url : String

    def initialize(@webhook_url : String = WEBHOOK_URL)
    end

    def notify(parser : Parser)
      payload = {
        text: parser.text,
        channel: parser.channel,
        icon_emoji: parser.icon_emoji,
        icon_url: parser.icon_url,
        username: parser.username
      }

      headers = HTTP::Headers{"Content-Type": "application/json"}
      HTTP::Client.post @webhook_url, headers, payload.to_json
    end
  end
end

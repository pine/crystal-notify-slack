require "http"
require "json"
require "./parser"

module NotifySlack
  class Command
    getter webhook_url : String

    private def self.detect_webhook_url : String
      if ENV.has_key?("SLACK_WEBHOOK_URL")
        return ENV["SLACK_WEBHOOK_URL"]
      end
      {% if `test -f WEBHOOK_URL && echo "true" || echo "false"`.stringify.chomp == "true" %}
        return {{ `cat WEBHOOK_URL`.stringify.chomp }}
      {% else %}
        raise "You should export SLACK_WEBHOOK_URL='your slack incomming webhook url'"
      {% end %}
    end

    def initialize(@webhook_url : String = detect_webhook_url)
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

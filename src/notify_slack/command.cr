require "slack"
require "./parser"

module NotifySlack
  class Command
    WEBHOOK_URL = {{ `cat WEBHOOK_URL`.stringify.chomp }}

    getter webhook_url : String

    def initialize(@webhook_url : String = WEBHOOK_URL)
    end

    def notify(parser : Parser)
      hook = Slack::IncomingWebHook.new(
        parser.text,
        channel: parser.channel,
        icon_emoji: parser.icon_emoji,
        icon_url: parser.icon_url,
        username: parser.username
      )
      hook.send_to(@webhook_url)
    end
  end
end

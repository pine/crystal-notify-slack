require "option_parser"

module NotifySlack
  class Parser
    getter channel : String
    getter text : String
    getter username : String?
    getter icon_emoji : String?
    getter icon_url : String?

    def initialize
      @channel = ""
      @text = ""
      @username = nil
      @icon_emoji = nil
      @icon_url = nil
      @help_flag = false
    end

    def parse(args : Array(String))
      parser = OptionParser.new
      parser.banner = "Usage: notify-slack --channel=channel --username=username --icon_emoji=:innocent: --text=text"
      parser.on("--channel=CHANNEL", "[required] Slack channel") { |channel| @channel = channel }
      parser.on("--text=TEXT", "[required] Post text") { |text| @text = text }
      parser.on("--username=USERNAME", "Slack username") { |username| @username = username }
      parser.on("--icon_emoji=:emoji:", "Slack icon (emoji)") { |icon_emoji| @icon_emoji = icon_emoji }
      parser.on("--icon_url=URL", "Slack icon url") { |icon_url| @icon_url = icon_url }
      parser.on("--help", "Show help") { @help_flag = true }

      begin
        parser.parse(args.dup)
      rescue e : OptionParser::InvalidOption
        exit(parser)
      end

      if args.size == 0 || @help_flag || @channel.empty? || @text.empty?
        exit(parser)
      end
    end

    private def exit(parser : OptionParser)
      puts parser
      ::exit 0
    end
  end
end

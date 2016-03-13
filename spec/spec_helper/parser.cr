module NotifySlack
  class SpyParser < Parser
    getter! exit_called : Bool

    def initialize
      super
      @exit_called = false
    end

    private def exit(parser : OptionParser)
      @exit_called = true
    end
  end

  class MockParser < Parser
    def initialize
      @channel = "CHANNEL"
      @text = "TEXT"
      @username = "USERNAME"
      @icon_emoji = ":emoji:"
      @icon_url = "ICON_URL"
    end
  end
end

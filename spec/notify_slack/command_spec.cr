require "../spec_helper"

module NotifySlack
  describe Command do
    it "new" do
      command = Command.new(webhook_url: "WEBHOOK_URL")
      command.webhook_url.should eq("WEBHOOK_URL")
    end

    it "notify" do
      parser = MockParser.new
      command = Command.new(webhook_url: "WEBHOOK_URL")
      command.notify(parser)

      instance = Slack::IncomingWebHook.instance
      instance.text.should eq("TEXT")
      instance.channel.should eq("CHANNEL")
      instance.icon_emoji.should eq(":emoji:")
      instance.icon_url.should eq("ICON_URL")
      instance.username.should eq("USERNAME")
      instance.webhook_url.should eq("WEBHOOK_URL")
    end
  end
end

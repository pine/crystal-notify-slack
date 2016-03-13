require "../spec_helper"

module NotifySlack
  describe Command do
    it "new" do
      command = Command.new(webhook_url: "WEBHOOK_URL")
      command.webhook_url.should eq("WEBHOOK_URL")
    end

    it "notify" do
      WebMock.stub(:post, "WEBHOOK_URL/")
        .with(body: "{\"text\":\"TEXT\",\"channel\":\"CHANNEL\",\"icon_emoji\":\":emoji:\",\"icon_url\":\"ICON_URL\",\"username\":\"USERNAME\"}")
        .to_return(body: "")

      parser = MockParser.new
      command = Command.new(webhook_url: "WEBHOOK_URL")
      command.notify(parser)
    end
  end
end

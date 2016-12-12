require "../spec_helper"

module NotifySlack
  describe Parser do
    requires = ["--channel=CHANNEL", "--text=TEXT"]

    it "empty" do
      parser = SpyParser.new
      parser.parse([] of String)

      parser.channel.should eq("")
      parser.text.should eq("")
      parser.exit_called.should be_true
    end

    it "required" do
      parser = SpyParser.new
      parser.parse(requires.dup)

      parser.channel.should eq("CHANNEL")
      parser.text.should eq("TEXT")
      parser.username.should be_nil
      parser.icon_emoji.should be_nil
      parser.icon_url.should be_nil
      parser.exit_called.should be_false
    end

    it "opts" do
      parser = SpyParser.new
      parser.parse(requires + [
        "--username=USERNAME",
        "--icon_emoji=:emoji:",
        "--icon_url=URL",
      ])

      parser.channel.should eq("CHANNEL")
      parser.text.should eq("TEXT")
      parser.username.should eq("USERNAME")
      parser.icon_emoji.should eq(":emoji:")
      parser.icon_url.should eq("URL")
      parser.exit_called.should be_false
    end
  end
end

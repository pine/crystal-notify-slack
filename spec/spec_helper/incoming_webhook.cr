class Slack::IncomingWebHook
  getter! webhook_url : String

  def self.instance : Slack::IncomingWebHook
    @@instance.not_nil!
  end

  def send_to(url)
    @webhook_url = url
    @@instance = self
  end
end

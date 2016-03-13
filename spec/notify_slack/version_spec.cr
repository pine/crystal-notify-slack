require "../spec_helper"

describe NotifySlack do
  it "VERSION" do
    NotifySlack::VERSION.should be_a(String)
  end
end

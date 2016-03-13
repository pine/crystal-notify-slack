require "./notify_slack/**"

parser = NotifySlack::Parser.new
parser.parse(ARGV)

command = NotifySlack::Command.new
command.notify(parser)

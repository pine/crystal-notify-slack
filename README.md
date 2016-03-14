# crystal-notify-slack [![Build Status](https://travis-ci.org/pine613/crystal-notify-slack.svg?branch=master)](https://travis-ci.org/pine613/crystal-notify-slack) [![Dependency Status](https://shards.rocks/badge/github/pine613/crystal-notify-slack/status.svg)](https://shards.rocks/github/pine613/crystal-notify-slack) [![devDependency Status](https://shards.rocks/badge/github/pine613/crystal-notify-slack/dev_status.svg)](https://shards.rocks/github/pine613/crystal-notify-slack)
> Slack notify CLI tool

## Usage

```
Usage: notify-slack --channel=channel --username=username --icon_emoji=:innocent: --text=text
    --channel=CHANNEL                [required] Slack channel
    --text=TEXT                      [required] Post text
    --username=USERNAME              Slack username
    --icon_emoji=:emoji:             Slack icon (emoji)
    --icon_url=URL                   Slack icon url
    --help                           Show help
```

### Specifiy web hook url at runtime

```bash
export SLACK_WEBHOOK_URL="https://hooks.slack.com/services/XXXXXXXXX/XXXXXXXXX/xxxxxxxxxxxxxxxxxxxxxxxx"
notify-slack --channel=channel --username=username --icon_emoji=:innocent: --text=text
```

## Build

```
$ echo "https://hooks.slack.com/services/XXXXXXXXX/XXXXXXXXX/xxxxxxxxxxxxxxxxxxxxxxxx" > WEBHOOK_URL
$ make deps
$ make build
```

## Test

```
$ make test
```

## Contributing

1. Fork it ( https://github.com/pine613/crystal-notify-slack/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## License
MIT License

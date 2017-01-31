# Alfred Bot

> Seu mordomo versão Bot ;)

_Warning: This is a work in progress._


### Setup

Create a Slack bot user from [here](https://my.slack.com/services/new/bot). You will receive an API token you can use. Set the `SLACK_API_TOKEN` environment variable and you should be good to go.

You can run this bot as below:

```shell
export SLACK_API_TOKEN="<SLACK_API_TOKEN>"
mix run --no-halt
```

A sample runner configuration looks like below:

```shell
export SLACK_API_TOKEN="<SLACK_API_TOKEN<"
export GITHUB_TOKEN="<GITHUB_TOKEN>"
export GOOGLE_API_KEY="<GOOGLE_API_KEY>"
export STANDUP_CHANNEL="scrum"
export GH_CHANNEL="github"
export PWN_CHANNEL="critical"
export UPTIME_CHANNEL="critical"

mix run --no-halt
```

### Responders

Currently, there are following responders and these should ideally work with any Hedwig adapters:

- `AlfredBot.Responders.GMap` - gives you google maps search result for your search queries.
- `AlfredBot.Responders.Pwned` -
- `AlfredBot.Responders.Quote` - gives you random funny quote
- `AlfredBot.Responders.Slap` - slaps another user
- `AlfredBot.Responders.Time` - gives time on given timezone (without timezone, uses local timezone of machine AlfredBot is running on)
- `AlfredBot.Responders.TimeConvert` - converts given unix timestamp to ISO8601 format
- `AlfredBot.Responders.EncodeDecode` - encoding/decoding tools
- `AlfredBot.Responders.Isup` - checks if a site is up or not via isitup.org API
- `AlfredBot.Responders.RandomInsult` - insults a user with random insults from randominsults.net
- `AlfredBot.Responders.HTTPCat` - gets a cat for corresponding http status code
- `AlfredBot.Responders.Howdoi` - tries to find answer for programming questions
- `AlfredBot.Responders.CommitMsg` - Get random commit messages from http://whatthecommit.com/index.txt
- `AlfredBot.Responders.CLIFu` - Gets clifu gems from http://www.commandlinefu.com
- `AlfredBot.Responders.Whois` - performs a whois query using https://dnsquery.org
- `AlfredBot.Responders.GitTip` - get a random git tip (with support for keywords)

For Google Maps search, you have to set `GOOGLE_API_KEY` which has access to call google places api.

```shell
alfred help - Displays all of the help commands that alfred knows about.
alfred help <query> - Displays all help commands that match <query>.
gmap <search_term> - Replies with the information from google places/maps.
pwned <search_account> - Checks to see if an account has been breached or not
quote - Replies with a random quote.
slap - Slaps the user. Format: slap <username> | me
time - get time in a given timezone
unix2iso <unix_timestamp> - Converts given unix timestamp to ISO format (Auto-replies for values that look like timestamps)
b64encode <content> - base64 encoding of given text content
b64decode <content> - base64 decoding of given text content
isitup <domain> - checks if given domain is up or not
insult me|<username> - insults given username with random insults
httpcat <status_code> - get http status code cat for given value
howdoi <query> - tries to find solution on the given query
commitmsg - get a random commit message
clifu [search_word] - get clifu gem (gives random clifu if no keyword is passed)
whois <domain> - gives whois query for given domain
```

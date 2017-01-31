# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :alfred_bot, AlfredBot.Responders.Standup,
  time_of_day: "30 10 * * 1-5",
  slack_channel: System.get_env("STANDUP_CHANNEL") || "general",
  suffix: ["folks", "hackers", "peeps", "avengers"],
  msg: "Standup time",
  enabled: true

config :alfred_bot, AlfredBot.Responders.Github,
  repos: ["techgaun/alfred_bot"],
  access_token: System.get_env("GITHUB_TOKEN"),
  schedule: "0 */1 * * *",
  slack_channel: System.get_env("GH_CHANNEL") || "general",
  created_time_threshold: 10800, # no old than 3 hours
  updated_time_threshold: 3600, # no old than 1 hour
  enabled: true

config :alfred_bot, AlfredBot.Responders.Quote,
  quote_src: "files/quotes.txt"

config :alfred_bot, AlfredBot.Responders.Pwned,
  schedule: "59 23 */1 * *",
  enabled: true,
  accounts: [
    "abc@example.com",
    "def@example.com"
  ],
  slack_channel: System.get_env("PWN_CHANNEL") || "general"

config :alfred_bot, AlfredBot.Responders.Uptime,
  schedule: "*/5 * * * *",
  enabled: true,
  endpoints: [
    [
      uri: "https://api.brighterlink.io/status", status_code: 200, content: ~s("msg":"ok"), method: "GET",
      content_type: "application/json", req_headers: [{"User-Agent", "AlfredBot"}], timeout: 20_000
    ]
  ],
  slack_channel: System.get_env("UPTIME_CHANNEL") || "general"

config :alfred_bot, AlfredBot.Robot,
  adapter: Hedwig.Adapters.Slack,
  name: "alfred",
  aka: "/",
  token: System.get_env("SLACK_API_TOKEN"),
  responders: [
    {Hedwig.Responders.Help, []},
    {AlfredBot.Responders.GMap, []},
    {AlfredBot.Responders.Pwned, []},
    {AlfredBot.Responders.Quote, []},
    {AlfredBot.Responders.Slap, []},
    {AlfredBot.Responders.Time, []},
    {AlfredBot.Responders.TimeConvert, []},
    {AlfredBot.Responders.EncodeDecode, []},
    {AlfredBot.Responders.Isup, []},
    {AlfredBot.Responders.RandomInsult, []},
    {AlfredBot.Responders.HTTPCat, []},
    {AlfredBot.Responders.Howdoi, []},
    {AlfredBot.Responders.CommitMsg, []},
    {AlfredBot.Responders.CLIFu, []},
    {AlfredBot.Responders.Whois, []},
    {AlfredBot.Responders.GitTip, []}
  ]

config :quantum, timezone: System.get_env("SYSTEM_TIME") || "America/Sao_Paulo"

config :ex_google,
  api_key: System.get_env("GOOGLE_API_KEY"),
  output: "json"


# This configuration is loaded before any dependency and is restricted
# to this project. If another project depends on this project, this
# file won't be loaded nor affect the parent project. For this reason,
# if you want to provide default values for your application for
# 3rd-party users, it should be done in your "mix.exs" file.

# You can configure for your application as:
#
#     config :alfred_bot, key: :value
#
# And access this configuration in your application as:
#
#     Application.get_env(:alfred_bot, :key)
#
# Or configure a 3rd-party app:
#
#     config :logger, level: :info
#

# It is also possible to import configuration files, relative to this
# directory. For example, you can emulate configuration per environment
# by uncommenting the line below and defining dev.exs, test.exs and such.
# Configuration from the imported file will override the ones defined
# here (which is why it is important to import them last).
#
#     import_config "#{Mix.env}.exs"

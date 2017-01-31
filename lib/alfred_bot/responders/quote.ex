defmodule AlfredBot.Responders.Quote do
  @moduledoc """
  Random Quote, FTW!

  Sends random message when someone says `quote`
  """
  use Hedwig.Responder

  @quotes_file Application.get_env(:alfred_bot, AlfredBot.Responders.Quote)[:quote_src]
  @usage """
  quote - Replies with a random quote.
  """
  hear ~r/^quote(!)?$/i, msg do
    reply msg, random(quotes())
  end

  defp quotes, do: @quotes_file |> File.read! |> String.split("\n")
end

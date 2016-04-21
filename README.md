# LineBotApi

LINE BOT API implementation for the ErlangVM

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add line_bot_api to your list of dependencies in `mix.exs`:

        def deps do
          [{:line_bot_api, "~> 0.0.1"}]
        end

  2. Ensure line_bot_api is started before your application:

        def application do
          [applications: [:line_bot_api]]
        end

# LineBotApi

[![Build Status](https://travis-ci.org/niku/line_bot_api.svg?branch=master)](https://travis-ci.org/niku/line_bot_api)

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

## Documentation

You can generate documentation via the command line as follows:

```
$ mix doc
```

To know detail, see [ex_doc](https://github.com/elixir-lang/ex_doc).

## Static analsys

You can check statically analyze via the command line as follows:

```
$ mix do dialyzer.plt, dialyzer
```

To know detail, see [dialyxir](https://github.com/jeremyjh/dialyxir).

## Linting

You can lint via the command line as follows:

```
$ mix credo --strict
```

To know detail, see [credo](https://github.com/rrrene/credo).

## License

The project is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

defmodule LineBotApi.SendingMessage.Content do
  @moduledoc false

  @type t :: any

  @callback for_request(t) :: %{String.t => any}

  @doc false
  defmacro __using__(_opts) do
    quote do
      @behaviour LineBotApi.SendingMessage.Content
    end
  end
end

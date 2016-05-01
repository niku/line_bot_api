defmodule LineBotApi.SendingMessage.Content.Text do
  @moduledoc """
  a module for [text content](https://developers.line.me/bot-api/api-reference#sending_message_text)
  """

  use LineBotApi.SendingMessage.Content

  @content_type 1

  defstruct [:to_type, :text]
  @type t :: %__MODULE__{to_type: non_neg_integer, text: String.t}

  @doc """
  Build a content from a given struct.

  ## Examples

  iex> content = %LineBotApi.SendingMessage.Content.Text{to_type: 1, text: "Hello, Jose!"}
  iex> LineBotApi.SendingMessage.Content.Text.for_request(content)
  %{"contentType" => 1, "text" => "Hello, Jose!", "toType" => 1}

  """
  @spec for_request(t) :: %{String.t => String.t, String.t => integer}
  def for_request(content) do
    %{
      "contentType" => @content_type,
      "toType"      => content.to_type,
      "text"        => content.text
    }
  end
end

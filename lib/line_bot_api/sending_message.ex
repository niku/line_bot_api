defmodule LineBotApi.SendingMessage do
  @moduledoc """
  A module provides [sending message](https://developers.line.me/bot-api/api-reference#sending_message) to LINE API.
  """

  @endpoint_url "https://trialbot-api.line.me/v1/events"
  @channel 1383378250
  @event_type "138311608800106203"

  @doc """
  Build a body from given ids and a struct.

  ## Examples

  iex> content = %LineBotApi.SendingMessage.Content.Text{to_type: 1, text: "Hello, Jose!"}
  iex> LineBotApi.SendingMessage.for_request(["u5912407b444e54885d00111f7b0ce375"], content)
  %{"content" => %{"contentType" => 1, "text" => "Hello, Jose!", "toType" => 1}, "eventType" => "138311608800106203", "to" => ["u5912407b444e54885d00111f7b0ce375"], "toChannel" => 1383378250}

  """
  @spec for_request([String.t], LineBotApi.SendingMessage.Content.t) :: %{String.t => String.t, String.t => %{}}
  def for_request(to, %{__struct__: content_type} = content) do
    %{
      "to"        => to,
      "toChannel" => @channel,
      "eventType" => @event_type,
      "content"   => content_type.for_request(content)
    }
  end

  @doc """
  Send a message to users which are represented by id
  """
  @spec send(LineBotApi.AccessToken.t, [String.t], LineBotApi.SendingMessage.Content.t, (String.t, %{}, %{}, Keyword.t -> any)) :: any
  def send(access_token, to, content, client \\ &HTTPoison.post/4) do
    body = for_request(to, content)
    headers = LineBotApi.AccessToken.for_request(access_token)

    client.(@endpoint_url, body, headers, [])
  end
end

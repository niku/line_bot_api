defmodule LineBotApi.SendingMessageTest do
  use ExUnit.Case, async: true
  doctest LineBotApi.SendingMessage

  test "send/4" do
    my_pid = self
    access_token = %LineBotApi.AccessToken{channel_id: "YOUR_CHANNEL_ID", channel_secret: "YOUR_CHANNEL_SECRET", channel_mid: "YOUR_CHANNEL_MID"}
    to = ["u5912407b444e54885d00111f7b0ce375"]
    content = %LineBotApi.SendingMessage.Content.Text{to_type: 1, text: "Hello, Jose!"}
    client = fn (url, body, headers, option) ->
      send my_pid, {url, body, headers, option}
    end

    LineBotApi.SendingMessage.send(access_token, to, content, client)
    receive do
      {url, body, headers, options} ->
        assert url == "https://trialbot-api.line.me/v1/events"
        assert body == %{
          "to" => to,
          "toChannel" => 1383378250,
          "eventType" => "138311608800106203",
          "content" => %{
            "contentType" => 1,
            "text" => content.text,
            "toType" => content.to_type
          }
        }
        assert headers == %{
          "Content-Type" => "application/json; charset=UTF-8",
          "X-Line-ChannelID" => access_token.channel_id,
          "X-Line-ChannelSecret" => access_token.channel_secret,
          "X-Line-Trusted-User-With-ACL" => access_token.channel_mid
        }
        assert options == []
    end
  end
end

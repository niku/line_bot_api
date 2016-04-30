defmodule LineBotApi.AccessToken do
  @moduledoc """
  A token for accessing to the line bot api.
  """

  @content_type "application/json; charset=UTF-8"

  defstruct [:channel_id, :channel_secret, :channel_mid]
  @type t :: %__MODULE__{channel_id: String.t, channel_secret: String.t, channel_mid: String.t}

  @doc """
  Create a request parameter from a given token.

  ## Examples

  iex> access_token = %LineBotApi.AccessToken{channel_id: "YOUR_CHANNEL_ID", channel_secret: "YOUR_CHANNEL_SECRET", channel_mid: "YOUR_CHANNEL_MID"}
  iex> LineBotApi.AccessToken.for_request(access_token)
  %{"Content-Type" => "application/json; charset=UTF-8", "X-Line-ChannelID" => "YOUR_CHANNEL_ID", "X-Line-ChannelSecret" => "YOUR_CHANNEL_SECRET", "X-Line-Trusted-User-With-ACL" => "YOUR_CHANNEL_MID"}
  """
  @spec for_request(t) :: %{String.t => String.t}
  def for_request(%__MODULE__{} = access_token) do
    %{
      "Content-Type"                 => @content_type,
      "X-Line-ChannelID"             => access_token.channel_id,
      "X-Line-ChannelSecret"         => access_token.channel_secret,
      "X-Line-Trusted-User-With-ACL" => access_token.channel_mid
    }
  end
end

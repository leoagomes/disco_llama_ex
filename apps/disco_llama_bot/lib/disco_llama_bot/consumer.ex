defmodule DiscoLlamaBot.Consumer do
  use Nostrum.Consumer

  alias Nostrum.Api

  def handle_event({:MESSAGE_CREATE, message, _ws_state}) do
    case message.content do
      "!hello" ->
        Api.create_message(message.channel_id, "hey!")

      _ ->
        :ignore
    end
  end

  # debug print any received event
  def handle_event(event) do
    IO.inspect(event)
    :ignore
  end
end

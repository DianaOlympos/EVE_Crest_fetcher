defmodule CrestRequest.Worker do
  use GenServer

## Client API

  @doc """
  Starts the worker.
  """
  def start_link() do
    GenServer.start_link(__MODULE__, :ok)
  end

  @doc """
  ask for a request from a relative path
  """
  def request_crest(server, path, :public) do
    GenServer.call(server,[path, :public])
  end


  ## Server Callbacks

  def init(_state) do
    :ok
  end

  def handle_call([path, :public], _from, _state) do
    result = path
#            |>add_crest_address(:public)
            |>add_header
            |>HTTPoison.get

    {:reply, result, :ok}
  end

  # defp add_crest_address(path, :public) do
  #   address = Application.get_env(:fetch_crest_market,:crest_public_address)
  #   address<>path
  # end

  defp add_header(url) do
    user_agent = Application.get_env(:fetch_crest_market,:user_agent)
    [url,
      [{"Accept", "application/json"},
        {"accept-encoding", "gzip"},
        {"user-agent", user_agent},
        {"X-Clacks-Overhead", "GNU Terry Pratchett"}
      ]
    ]
  end

end
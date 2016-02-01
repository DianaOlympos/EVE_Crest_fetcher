defmodule CrestRequest.Limiter do

  @doc """
  Send a message every sec to reset the Agent count
  """
  def reset_limit() do
    Agent.update(CrestRequest.Limit,CrestRequest.Limit.reset)
    send_after(:self, :ok, 1000)
    on_receive()
  end

  defp on_receive() do
    receive do
      :ok -> reset_limit()
      _ -> on_receive()
    after
      2000 -> reset_limit()
    end
  end

end

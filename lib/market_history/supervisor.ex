defmodule MarketHistory.Supervisor do
  use Supervisor
  import MarketHistory

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    children = [
      worker(MarketHistory,[],function: start_region)
    ]

    supervise(children, strategy: :one_for_one)
  end
end
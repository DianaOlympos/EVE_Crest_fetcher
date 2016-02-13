defmodule MarketHistory.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    children = [
      worker(MarketHistory.Registry, [MarketHistory.Registry]),
      supervisor(MarketHistory.Types.Supervisor, [])
    ]

    supervise(children, strategy: :rest_for_one)
  end
end
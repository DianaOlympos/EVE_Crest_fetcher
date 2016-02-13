defmodule MarketHistory.Types.Supervisor do
  use Supervisor

  # A simple module attribute that stores the supervisor name
  @name MarketHistory.Types.Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, :ok, name: @name)
  end

  def start_types(id, pageCount,totalCount, items_list) do
    Supervisor.start_child(@name, [id, pageCount,totalCount, items_list])
  end

  def init(:ok) do
    children = [
      worker(MarketHistory.Types, [], restart: :temporary)
    ]

    supervise(children, strategy: :simple_one_for_one)
  end
end
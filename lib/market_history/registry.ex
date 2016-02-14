defmodule MarketTypes.Registry do
  use GenServer

  ## Client API

  @doc """
  Starts the registry with the given `name`.
  """
  def start_link(name) do
    GenServer.start_link(__MODULE__, name, name: name)
  end

  @doc """
  Looks up the type pid for `id` stored in `server`.

  Returns `{:ok, pid}` if the bucket exists, `:error` otherwise.
  """
  def lookup(server, id) when is_atom(server) do
    case :ets.lookup(server, id) do
      [{^id, type}] -> {:ok, type}
      [] -> :error
    end
  end

  @doc """
  Ensures there is a bucket associated to the given `id` in `server`.
  """
  def create(server, id, pageCount,totalCount, items_list) do
    GenServer.call(server, {:create, id, pageCount,totalCount, items_list})
  end

  @doc """
  Stops the registry.
  """
  def stop(server) do
    GenServer.stop(server)
  end

  ## Server callbacks

  def init(table) do
    types = :ets.new(table, [:named_table, read_concurrency: true])
    refs  = %{}
    {:ok, {types, refs}}
  end

  def handle_call({:create, id, pageCount,totalCount, items_list}, _from, {types, refs}) do
    case lookup(types, id) do
      {:ok, pid} ->
        {:reply, pid, {types, refs}}
      :error ->
        {:ok, pid} = MarketHistory.Types.Supervisor.start_types(id, pageCount,totalCount, items_list)
        ref = Process.monitor(pid)
        refs = Map.put(refs, ref, id)
        :ets.insert(types, {id, pid})
        {:reply, pid, {types, refs}}
    end
  end

  def handle_info({:DOWN, ref, :process, _pid, _reason}, {types, refs}) do
    {id, refs} = Map.pop(refs, ref)
    :ets.delete(types, id)
    {:noreply, {types, refs}}
  end

  def handle_info(_msg, state) do
    {:noreply, state}
  end
end
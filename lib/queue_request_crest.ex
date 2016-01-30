defmodule QueueRequestCrest do
  use GenServer
   # Client

  def start_link(default) do
    GenServer.start_link(__MODULE__, default)
  end

  def push(pid, item) do
    GenServer.call(pid, {:push, item})
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  # Server (callbacks)

  def handle_call(:pop, _from, [h|t]) do
    {:reply, h, t}
  end

  def handle_call({:push, item}, _from, state) do
    {:reply, {:ok, item}, [item|state]}
  end

  def handle_call(request, from, state) do
    # Call the default implementation from GenServer
    super(request, from, state)
  end

  def handle_cast({:push, item}, state) do
    {:noreply, [item|state]}
  end

  def handle_cast(request, state) do
    super(request, state)
  end

  def handle_info(_msg, state) do
    {:noreply, state}
  end
end
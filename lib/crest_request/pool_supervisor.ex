defmodule CrestRequest.PoolSupervisor do
  use Supervisor

  def start_link do
    :supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    # Here are my pool options
    pool_options = [
      name: {:local, :crest_pool},
      worker_module: CrestRequest.Worker,
      size: 15,
      max_overflow: 5
    ]

    children = [
      :poolboy.child_spec(:crest_pool, pool_options, [])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
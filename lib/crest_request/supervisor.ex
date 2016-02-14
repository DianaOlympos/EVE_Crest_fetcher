defmodule CrestRequest.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do

    children = [
      supervisor(CrestRequest.PoolSupervisor,[]),
      worker(Task, [CrestRequest.Limiter, :reset_limit,[]], name: CrestRequest.Limiter),
      worker(Agent, [CrestRequest.Limit, :init_limit, [0]], name: CrestRequest.Limit)
    ]

    opts = [strategy: :one_for_one, name: CrestRequest.Supervisor]
    supervise(children, opts)
  end
end
defmodule CrestRequest.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do

    children = [
      worker(Task, [CrestRequest.Limiter, :reset_limit, [], name:CrestRequest.Limiter]),
      worker(Agent, [CrestRequest.Limit, :init_limit, [0], name:CrestRequest.Limit])
    ]

    opts = [strategy: :one_for_one, name: CrestRequest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
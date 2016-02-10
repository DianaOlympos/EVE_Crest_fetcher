defmodule CrestRequest.Limit do

  def init_limit (state) do
    state
  end

  def is_limited (state) do
    if state>= Application.get_env(:fetch_crest_market,:crest_rate) do
      {:false,state}
    else
      {:true,state+1}
    end
  end

  def reset() do
    0
  end
end

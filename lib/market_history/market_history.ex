defmodule MarketHistory do
  import MarketHistory.Registry, only: [create: 5]

  def start_region() do
    address = Application.get_env(:fetch_crest_market,:crest_public_address)<>"regions/10000002/types/34/history/"

    case :poolboy.transaction(:crest_pool, fn(pid)->
      CrestRequest.Worker.request_crest(pid,address,:public)
    end) do
      {:ok,result}-> stock_body(result)
      {:error,_}-> start_region()
    end

  end

  defp stock_body(body) do
    case Poison.decode(body, as: %CrestMarketHistory{}) do
      {:ok, history} -> create(MarketHistory.Registry, 34, history.pageCount, history.totalCount, history.items)
      {:error,message}-> message
    end
  end
end
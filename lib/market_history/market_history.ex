defmodule MarketHistory do
  import CrestRequest.Worker, only: [request_crest: 3]
  import MarketTypes.Registry, only: [create: 2]


  def start_region(region_name) do
    address = Application.get_env(:fetch_crest_market,:crest_public_address)<>"regions/10000002/types/34/history/"

    case :poolboy.transaction(:crest_pool, fn(pid)->
      request_crest(pid,address,:public)
    end) do
      {:ok,result}-> case Poison.decode(result) as: %CrestMarketHistory{}
                      do
                        {:ok, history} -> create(MarketHistory.Registry, 34, history.pageCount, history.totalCount, history.items)
                        {error,message}-> message
      {:error,msg}-> start_region(region_name)
    end

  end

end
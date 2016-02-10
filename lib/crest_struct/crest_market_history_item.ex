defmodule CrestMarketHistoryItem do
  defstruct volume_str: "", orderCount: 0, lowPrice: 0, highPrice: 0,
    avgPrice: 0, volume: 0, orderCount_str: "", date: ""
  @type t :: %CrestMarketHistoryItem{volume_str: String.t, orderCount: integer,
    lowPrice: integer, highPrice: integer, avgPrice: integer, volume: integer, orderCount_str: String.t, date: String.t}
end

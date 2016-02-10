defmodule CrestMarketHistory do
  defstruct totalCount_str: "", items: [], pageCount: 1, pageCount_str: "1", totalCount: 0
  @type t :: %CrestMarketHistory{totalCount_str: String.t, items: [CrestMarketHistoryItem.t],
    pageCount: integer, pageCount_str: String.t, totalCount: integer}
end

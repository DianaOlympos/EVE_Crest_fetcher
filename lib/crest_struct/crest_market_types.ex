defmodule CrestMarketTypes do
  defstruct totalCount_str: "", items: [], pageCount: 1, pageCount_str: "1", totalCount: 0 , next: "", previous: ""
  @type t :: %CrestMarketTypes{totalCount_str: String.t, items: [CrestMarketTypes.Items.t],
    pageCount: integer, pageCount_str: String.t, totalCount: integer, next: String.t, previous: String.t}
end

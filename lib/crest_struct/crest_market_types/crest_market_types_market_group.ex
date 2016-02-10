defmodule CrestMarketTypes.MarketGroup do
  defstruct href: "", id: 0, id_str: "0"
  @type t :: %CrestMarketTypes.MarketGroup{href: String.t, id: integer, id_str: String.t}
end

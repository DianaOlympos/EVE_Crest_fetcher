defmodule CrestMarketTypes.Items do
  defstruct marketGroup: %CrestMarketTypes.MarketGroup{}, type: %CrestMarketTypes.Type{}, href: "",
   id: 0, id_str: "0"
  @type t :: %CrestMarketTypes.Items{marketGroup: CrestMarketTypes.MarketGroup.T,
    type: CrestMarketTypes.Type.t,href: String.t, id: integer, id_str: String.t}
end

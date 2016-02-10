defmodule CrestMarketTypes.Type do
  defstruct href: "", id: 0, id_str: "0", name: "", icon: ""
  @type t :: %CrestMarketTypes.Type{href: String.t, id: integer, id_str: String.t,
    name: String.t, icon: String.t}
end
defmodule MarketHistory.Types do
  @doc """
  Starts a new types container.
  """
  def start_link(id, pageCount,totalCount, items_list) do
    Agent.start_link(fn -> {id, pageCount, totalCount, items_list} end)
  end

  @doc """
  Gets the list of price from the `types`.
  """
  def get_items(types) do
    Agent.get(types, fn {_,_,_, items_list} -> items_list end)
  end

  @doc """
  Gets the number of pages from the `types`.
  """
  def get_pageCount(types) do
    Agent.get(types, fn {_,pageCount,_,_} -> pageCount end)
  end

  @doc """
  Gets the number of items from the `types`.
  """
  def get_totalCount(types) do
    Agent.get(types, fn {_,_,totalCount,_} -> totalCount end)
  end

  @doc """
  Gets the id of the object from the `types`.
  """
  def get_id(types) do
    Agent.get(types, fn {id,_,_,_} -> id end)
  end

  @doc """
  adds items to the list.
  """
  def put_items(types, items_list) do
    Agent.update(types, fn {_,_,_,list} -> Enum.concat(items_list, list) end)
  end

end
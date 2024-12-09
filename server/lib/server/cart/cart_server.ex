defmodule Server.Cart.CartServer do
  use GenServer

  # Public API
  def start_link(user_id) do
    # returns {:ok, PID}
    GenServer.start_link(__MODULE__, %{user_id: user_id, items: %{}}, name: Server.Cart.CartServer)
  end

  @doc """
  `pid` is the PID returned by start_link
  `product_id` product to add
  """
  def add_item(pid, product_id) do
    GenServer.call(pid, {:add_item, product_id})
  end

  def remove_item(pid, product_id) do
    GenServer.call(pid, {:remove_item, product_id})
  end

  def list_all(pid) do
    GenServer.call(pid, :list_all)
  end

  # Call backs
  @doc """
  `state` is a map with :user_id and :items keys
  """
  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_call({:add_item, product_id}, _from, %{items: items} = state) do
    new_quantity = Map.get(items, product_id, 0) + 1
    {:reply, :ok, %{state | items: Map.put(items, product_id, new_quantity)}}
  end

  @impl true
  def handle_call({:remove_item, product_id}, _from, %{items: items} = state) do
    if Map.has_key?(state, product_id) do
      {:reply, :ok, %{state | items: Map.delete(items, product_id)}}
    else
      {:reply, :error, state}
    end
  end

  @impl true
  def handle_call(:list_all, _from, state) do
    {:reply, state.items, state}
  end
end

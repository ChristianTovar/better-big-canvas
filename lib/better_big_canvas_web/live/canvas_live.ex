defmodule BetterBigCanvasWeb.CanvasLive do
  use Phoenix.LiveView, layout: {BetterBigCanvasWeb.LayoutView, "live.html"}

  @impl true
  def render(assigns) do
    ~L"""
    <span>this will be a cool canvas</span>
    """
  end

  @impl true
  def mount(_params, _session, socket), do: {:ok, socket}
end

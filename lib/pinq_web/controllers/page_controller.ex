defmodule PinqWeb.PageController do
  use PinqWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

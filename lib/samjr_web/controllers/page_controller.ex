defmodule SamjrWeb.PageController do
  use SamjrWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end

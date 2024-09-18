defmodule SamtWeb.PageController do
  use SamtWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end

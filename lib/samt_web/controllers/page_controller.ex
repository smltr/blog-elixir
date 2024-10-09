defmodule SamtWeb.PageController do
  use SamtWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end

  def resume(conn, _params) do
    conn
    |> send_download({:file, "priv/static/Sam_Trouy_Resume.pdf"},
      disposition: :inline,
      filename: "Sam_Trouy_Resume.pdf"
    )
  end
end

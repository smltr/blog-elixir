defmodule SamtWeb.RedirectController do
  use SamtWeb, :controller

  def resume_pdf(conn, _params) do
    redirect(conn, to: "/Sam_Trouy_Resume.pdf")
  end
end

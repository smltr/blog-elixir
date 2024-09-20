defmodule SamtWeb.AppLive do
  use SamtWeb, :live_view
  alias SamtWeb.HomePage
  alias SamtWeb.Blog

  def mount(params, _session, socket) do
    {:ok, assign(socket, current_page: get_page(params))}
  end

  def handle_params(_params, uri, socket) do
    dbg(uri = URI.parse(uri).path)

    {:noreply, assign(socket, current_page: get_page(uri))}
  end

  defp get_page("/blog"), do: :blog
  defp get_page("/blog/" <> slug), do: {:blog_post, slug}
  defp get_page("/"), do: :home
  defp get_page(_), do: :home

  def render(assigns) do
    ~H"""
    <main>
      <nav class="mb-8">
        <ul class="flex space-x-4 text-sm">
          <li>
            <.link patch={~p"/"} class="text-gray-500 hover:text-sky-600">home</.link>
          </li>
          <li>
            <.link patch={~p"/blog"} class="text-gray-500 hover:text-sky-600">blog</.link>
          </li>
        </ul>
      </nav>
      <%= render_page(assigns) %>
    </main>
    """
  end

  defp render_page(%{current_page: :home} = assigns),
    do: ~H"<HomePage.render />"

  defp render_page(%{current_page: :blog} = assigns),
    do: ~H"<Blog.List.render />"

  defp render_page(%{current_page: {:blog_post, _slug}} = assigns) do
    ~H"<Blog.Post.render {assigns} />"
  end
end

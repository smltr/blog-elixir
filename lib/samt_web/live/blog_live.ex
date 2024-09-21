defmodule SamtWeb.BlogLive do
  use SamtWeb, :live_view
  alias SamtWeb.Blog.PostSummary

  def mount(_params, _session, socket) do
    posts = Samt.Blog.list_posts()
    {:ok, assign(socket, posts: posts)}
  end

  def render(assigns) do
    ~H"""
    <%= if length(@posts) >= 1 do %>
      <h1 class="text-xl font-bold mb-2 md:ml-[-2.1rem]">
        <.icon name="hero-newspaper" class="mb-1 mr-1" /> All Blog Posts
      </h1>
      <%= for post <- @posts do %>
        <PostSummary.render post={post} />
      <% end %>
    <% else %>
      <h1 class="text-lg font-bold text-zinc-500">
        First post coming soon!
      </h1>
    <% end %>
    """
  end
end

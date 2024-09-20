defmodule SamtWeb.BlogLive do
  use SamtWeb, :live_view
  alias SamtWeb.Blog.PostSummary

  def mount(_params, _session, socket) do
    posts = Samt.Blog.list_posts()
    {:ok, assign(socket, posts: posts)}
  end

  def render(assigns) do
    ~H"""
    <h1 class="text-2xl font-bold mb-4">All Blog Posts</h1>
    <%= for post <- @posts do %>
      <PostSummary.render post={post} />
    <% end %>
    """
  end
end

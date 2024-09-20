defmodule SamtWeb.HomeLive do
  alias SamtWeb.Blog.PostSummary
  use SamtWeb, :live_view

  def mount(_params, _session, socket) do
    posts = Samt.Blog.get_recent_posts(2)
    {:ok, assign(socket, posts: posts)}
  end

  def render(assigns) do
    ~H"""
    <h1 class="text-2xl font-bold mb-4">About me</h1>
    <p class="mb-2">
      I'm <span class="text-sky-600">Sam Trouy</span>, a full stack software developer based out of Chattanooga, TN. I love startups and have worked previously as a founding engineer for 2 years.
    </p>
    <p class="mb-2">
      I enjoy tinkering with new programming languages and frameworks. I like rapid prototyping and am always looking to improve my go-to toolset. Recently I've been building with Elixir/Phoenix/LiveView.
    </p>
    <p class="">
      LLMs are a huge interest of mine. I use AI assistants to supercharge my work and learning.
    </p>

    <%= if length(@posts) >= 1 do %>
      <h1 class="text-2xl font-bold mt-4 mb-4">Recent Blog Posts</h1>
      <%= for post <- @posts do %>
        <PostSummary.render post={post} />
      <% end %>
    <% end %>
    """
  end
end

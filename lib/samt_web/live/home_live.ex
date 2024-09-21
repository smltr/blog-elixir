defmodule SamtWeb.HomeLive do
  alias SamtWeb.Blog.PostSummary
  use SamtWeb, :live_view

  def mount(_params, _session, socket) do
    posts = Samt.Blog.get_recent_posts(2)
    {:ok, assign(socket, posts: posts)}
  end

  def render(assigns) do
    ~H"""
    <h1 class="text-xl font-bold mb-2">
      About me
    </h1>
    <p class="mb-2">
      I'm Sam, a full stack software developer based out of Chattanooga, TN. The startup world fascinates me and there's always a handful of ideas on my mind about possible mini-startups of my own. I previously worked as a founding engineer for 2 years.
    </p>
    <p class="mb-2">
      I enjoy tinkering with new programming languages and frameworks. I like rapid prototyping and am trying to settle down on my go-to toolset. Recently I've been building with Elixir/Phoenix/LiveView.
    </p>
    <p class="">
      I'm building this blog both because I want to, and because I need a recent portfolio project. It's hard for me to build things only for show that I know won't get used, so this seemed like a win-win.
    </p>

    <%= if length(@posts) >= 1 do %>
      <.divider class="w-1/3" />
      <h1 class="text-xl font-bold mb-2 md:ml-[-2.1rem]">
        <.icon name="hero-newspaper" class="mb-1 mr-1" /> Recent Blog Posts
      </h1>
      <%= for post <- @posts do %>
        <PostSummary.render post={post} />
      <% end %>
    <% end %>
    """
  end
end

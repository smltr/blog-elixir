defmodule SamtWeb.BlogLive do
  use SamtWeb, :live_view
  alias SamtWeb.Blog.PostSummary
  alias SamtWeb.Blog.Post
  alias Samt.Blog

  def mount(_params, _session, socket) do
    posts = Samt.Blog.list_posts()
    {:ok, assign(socket, posts: posts)}
  end

  def handle_params(%{"slug" => slug}, _uri, socket) do
    post = Blog.get_post_by_slug!(slug)
    {:noreply, assign(socket, current_post: post, live_action: :view_post)}
  end

  def handle_params(_params, _uri, socket) do
    {:noreply, assign(socket, live_action: socket.assigns.live_action)}
  end

  def render(%{live_action: :blog_list} = assigns), do: blog_list(assigns)
  def render(%{live_action: :view_post} = assigns), do: view_post(assigns)
  def render(%{live_action: :home} = assigns), do: view_home(assigns)

  def view_home(assigns) do
    ~H"""
    <h1 class="text-xl font-bold mb-2">
      About me
    </h1>
    <p class="mb-2">
      I'm Sam, a full stack software developer based out of Chattanooga, TN. The startup world fascinates me and there's always a handful of ideas on my mind about possible mini-startups of my own. I previously worked as a founding engineer for 2 years.
    </p>
    <p class="mb-2">
      All who need an accountability partner, or just a fresh set of eyes on a problem, are invited to collaborate with me. I use Zed, an awesome 'multiplayer' code editor with a great collaboration feature.
    </p>
    <p class="mb-2">
      <.link
        href="https://zed.dev/channel/Stuff-and-Junk-15158"
        class="font-bold text-zinc-500 hover:text-zinc-600"
      >
        Join my Zed channel<.icon name="hero-arrow-long-right-mini" class="mb-0.5 h-4 w-4" />
      </.link>
    </p>
    <.divider class="w-1/3" />
    <h1 class="text-xl font-bold mb-2 md:ml-[-2.1rem]">
      <.icon name="hero-newspaper" class="mb-1 mr-1" /> Recent Blog Posts
    </h1>

    <%= if length(@posts) >= 1 do %>
      <%= for post <- Enum.take(@posts, 3) do %>
        <PostSummary.render post={post} />
      <% end %>
    <% else %>
      <h1 class="text-lg font-bold text-zinc-500">
        First post coming soon!
      </h1>
    <% end %>
    """
  end

  def blog_list(assigns) do
    ~H"""
    <%= if length(@posts) >= 1 do %>
      <h1 class="text-xl font-bold mb-3 md:ml-[-2.1rem]">
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

  def view_post(assigns) do
    ~H"""
    <Post.render post={@current_post} />
    """
  end
end

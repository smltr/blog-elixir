defmodule SamtWeb.Blog.Post do
  use Phoenix.Component
  require Logger
  import Phoenix.HTML, only: [raw: 1]

  # Tinkering with ways of extracting class names from template
  defmacro h1_class, do: "text-2xl text-zinc-600 font-bold mb-4"

  def render(assigns) do
    ~H"""
    <article>
      <h1 class={h1_class()}><%= @post.title %></h1>
      <time class="text-sm text-gray-400">
        <%= Calendar.strftime(@post.published_at, "%B %d, %Y") %>
      </time>
      <div class="content mt-5">
        <%= raw(
          @post.content
          |> String.replace("\n", "<br>")
          |> String.replace(~r/\*\*(.*?)\*\*/, "<span class=\"italic font-bold\">\\1</span>")
        ) %>
      </div>
    </article>
    """
  end
end

defmodule SamtWeb.HomePage do
  use Phoenix.Component

  def render(assigns) do
    ~H"""
    <h1 class="text-3xl font-bold mb-4">About me</h1>
    <p class="mb-2">
      I'm <span class="text-sky-600">Sam Trouy</span>, a full stack software developer based out of Chattanooga, TN. I love startups and have worked previously as a founding engineer for 2 years.
    </p>
    <p class="mb-2">
      I enjoy tinkering with new programming languages and frameworks. I like rapid prototyping and am always looking to improve my go-to toolset. Recently I've been building with Elixir/Phoenix/LiveView.
    </p>
    <p class="mb-2">
      LLMs are a huge interest of mine. I use AI assistants to supercharge my work and learning.
    </p>
    """
  end
end

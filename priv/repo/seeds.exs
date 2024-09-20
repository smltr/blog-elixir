# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Samt.Repo.insert!(%Samt.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Samt.Repo
alias Samt.Blog.Post

Repo.insert!(%Post{
  title: "Hello, world!",
  content: """
  Good morning world, and all who inhabit it.

  As we embark on this new day, let us take a moment to appreciate the beauty and wonder that surrounds us. From the gentle rustle of leaves in the breeze to the warm rays of sunlight peeking through the clouds, nature offers us countless reminders of the magic of existence.

  In this interconnected world of ours, we each play a unique role in shaping the collective experience of humanity. Our actions, no matter how small, ripple outwards and touch the lives of others in ways we may never fully comprehend. So let us approach each interaction with kindness, each challenge with determination, and each opportunity with enthusiasm.

  As we go about our day, may we remember that every person we encounter is fighting their own battles and carrying their own dreams. By extending empathy and understanding to one another, we can create a world that is more compassionate, more inclusive, and more harmonious for all.

  So here's to new beginnings, to endless possibilities, and to the beautiful journey that lies ahead. Let's make today count!
  """,
  published_at: DateTime.utc_now() |> DateTime.truncate(:second),
  slug: "hello-world-2"
})

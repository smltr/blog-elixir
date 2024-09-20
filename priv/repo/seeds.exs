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
  title: "The Evolution of Programming Languages: A Brief Overview",
  content: """
  From the early days of machine code to today's high-level languages, the world of programming has undergone a remarkable transformation. This journey reflects not just technological advancement, but also changes in how we think about problem-solving and human-computer interaction.

  Assembly language marked the first step away from direct machine instructions, offering mnemonics that made code slightly more readable. Then came the revolution of high-level languages like FORTRAN and COBOL, which allowed programmers to express complex ideas in more human-readable form.

  The 1970s and 80s saw the rise of structured programming with languages like C, followed by the object-oriented paradigm exemplified by C++ and Java. These shifts fundamentally changed how we architect software, promoting modularity and reusability.

  In recent years, we've seen a trend towards more expressive and concise languages. Python and Ruby emphasize readability, while functional programming languages like Haskell and Elixir offer new ways to think about computation.

  As we look to the future, the line between natural and programming languages continues to blur. With advances in AI and natural language processing, who knows what the next paradigm shift in programming might bring?
  """,
  published_at: DateTime.utc_now() |> DateTime.truncate(:second),
  slug: "evolution-of-programming-languages"
})

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

Samt.Repo.insert!(%Samt.Blog.Post{
  title: "Test Markdown Post",
  content: """
  # Welcome to the Seed Post for Testing Markdown

  ## Table of Contents
  - [Introduction](#introduction)
  - [Code Example](#code-example)
  - [List Example](#list-example)
  - [Blockquote Example](#blockquote-example)
  - [Image Example](#image-example)

  ## Introduction
  This is a **seed post** used for populating the database. It contains various Markdown elements to test the _Earmark_ Elixir library.

  ## Code Example
  Here is a code block example:

  ```elixir
  defmodule Example do
    def hello do
      IO.puts("Hello, world!")
    end
  end
  ```

  ## List Example
  Here is an example of an ordered and unordered list:

  ### Unordered List
  - Item 1
  - Item 2
    - Subitem 2.1
    - Subitem 2.2
  - Item 3

  ### Ordered List
  1. First item
  2. Second item
     1. Subitem 2.1
     2. Subitem 2.2
  3. Third item

  ## Blockquote Example
  Here is an example of a blockquote:
  > This is a blockquote used to display quoted text.

  ## Image Example
  Here is an example of an image:

  ![Elixir Logo](https://elixir-lang.org/images/logo/logo.png)

  ## Conclusion
  This concludes the seed post. It includes various Markdown elements for testing purposes. **Happy testing!**
  """,
  published_at: DateTime.truncate(DateTime.utc_now(), :second),
  slug: "markdown-post",
  inserted_at: DateTime.truncate(DateTime.utc_now(), :second),
  updated_at: DateTime.truncate(DateTime.utc_now(), :second)
})

# trouy.dev

A personal landing page and blog.

Built using Elixir, Phoenix and LiveView.

## TODO

- Implement an easier way to create blog posts (currently manually sending to DB) as well as a way to better display them.
- Add an interesting, real-time feature that can show the unique capabilities of LiveView.

## Posting to Blog

To create a new blog post:

1. Create a SQL file locally (e.g. `samt/insert_post.sql`) with this template:
```sql
\c samt;

INSERT INTO posts (title, content, published_at, slug, inserted_at, updated_at)
VALUES (
    'Your Title',
    $$Your content here$$,
    NOW(),
    'your-slug',
    NOW(),
    NOW()
);
```

2. Connect to database:
```bash
fly postgres connect -a samt-db
```

3. After connecting, paste the entire SQL file content into the psql console.

Note: Make sure to hit enter after the `\c samt;` command completes before the INSERT statement is processed.

# LivebookEnv

A tiny library for using .env files with Livebook.

## Installation

This package is designed to be used in Livebooks, not full elixir projects.

Add this to your livebook setup block:

```elixir
Mix.install([
  {:livebook_env, "~> 1.0"}
])

LivebookEnv.import_dotenv("/global/path/to/your/project/.env")
```

That's it! Your environment variables should be available to your livebook.
## Use without installing

I released this utility as a package for quick livebook setup, but it consists of a single file.
You can avoid installation and isntead copy-paste the entire contents of `lib/livebook_env.ex` into the setup block of your Livebook. Then call `LivebookEnv.import_dotenv` as illustrated in the example above.

## Credits

The .env parsing code is taken from https://github.com/avdi/dotenv_elixir (thanks Avdi!)

## Contributing

PRs are welcome, you can discuss problems with me by opening a PR.

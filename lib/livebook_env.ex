defmodule LivebookEnv do
  @moduledoc """
  A tiny utility for importing .env files into Livebooks.
  """

  @doc """
  Import a .env file into your current Livebook.

  Assuming you have a .env file containing `FOOBAR=123`:

  ## Examples

      iex> LivebookEnv.import_dotenv("/Users/alex/myproject/.env)
      {:ok, "Imported 1 variable(s): FOOBAR"}

  """
  def import_dotenv(envfile_path) do
    env = envfile_path
    |> File.read!()
    |> parse_contents()

    System.put_env(env)

    {
      :ok,
      "Imported #{Enum.count(env)}: #{Map.keys(env) |> Enum.join(", ")}"
    }
  end

  # Implementation

  @quotes_pattern ~r/^(['"])(.*)\1$/
  @pattern ~r/
    \A
    (?:export\s+)?    # optional export
    ([\w\.]+)         # key
    (?:\s*=\s*|:\s+?) # separator
    (                 # optional value begin
      '(?:\'|[^'])*?' #   single quoted value
      |               #   or
      "(?:\"|[^"])*?" #   double quoted value
      |               #   or
      [^#\n]+?        #   unquoted value
    )?                # value end
    (?:\s*\#.*)?      # optional comment
    \z
    /x

  defp parse_contents(contents) do
    values = String.split(contents, "\n")

    values
    |> Enum.flat_map(&Regex.scan(@pattern, &1))
    |> trim_quotes_from_values
    |> Enum.reduce(Map.new(), &collect_into_map/2)
  end

  defp collect_into_map([_whole, k, v], env), do: Map.put(env, k, v)

  defp trim_quotes_from_values(values) do
    values
    |> Enum.map(fn values ->
      Enum.map(values, &trim_quotes/1)
    end)
  end

  defp trim_quotes(value) do
    String.replace(value, @quotes_pattern, "\\2")
  end
end

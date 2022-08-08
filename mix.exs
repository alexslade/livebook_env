defmodule LivebookEnv.MixProject do
  use Mix.Project

  def project do
    [
      app: :livebook_env,
      version: "0.1.0",
      elixir: "~> 1.13",
      deps: deps(),
      package: [
        name: "livebook_env",
        files: ~w(lib mix.exs README*),
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/alexslade/livebook_env"}
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.21", only: :dev, runtime: false}
    ]
  end
end

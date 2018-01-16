defmodule Joken.Mixfile do
  use Mix.Project

  @version "1.5.0"

  def project do
    [
      app: :joken,
      version: @version,
      name: "Joken",
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      consolidate_protocols: Mix.env() != :test,
      description: description(),
      package: package(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      docs: docs_config()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :crypto],
      mod: {Joken.Application, []}
    ]
  end

  defp deps do
    [
      {:jose, "~> 1.8"},
      {:jason, "~> 1.0.0-rc.2", optional: true},
      {:plug, "~> 1.0", optional: true},
      {:ex_doc, "~> 0.18", only: :dev, runtime: false},
      {:benchfella, "~> 0.3"},
      {:excoveralls, "~> 0.8", only: :test, runtime: false}
    ]
  end

  defp description do
    """
    JWT Library for Elixir
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE.txt", "CHANGELOG.md"],
      maintainers: ["Bryan Joseph", "Victor Nascimento"],
      licenses: ["Apache 2.0"],
      links: %{
        "GitHub" => "https://github.com/bryanjos/joken",
        "Docs" => "http://hexdocs.pm/joken"
      }
    ]
  end

  defp docs_config do
    [
      extras: [
        "README.md": [title: "Overview"],
        "CHANGELOG.md": [title: "Changelog"]
      ],
      main: "readme",
      source_ref: "v#{@version}",
      source_url: "https://github.com/bryanjos/joken"
    ]
  end
end
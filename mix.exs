defmodule UrlUnrollerApp.Mixfile do
  use Mix.Project

  def project do
    [app: :url_unroller_app,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:cowboy, :httpoison, :plug]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [{:httpoison, "~> 0.4"},
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 0.9.0"},
      {:url_unroller, "~> 0.0.1"}]
  end
end

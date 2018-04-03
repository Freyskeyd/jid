defmodule Jid.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :jid,
      version: @version,
      elixir: "~> 1.1",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      deps: deps(),
      docs: docs(),
      package: package(),
      test_coverage: [tool: ExCoveralls]]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {JID, []}]
  end

  defp description do
    "A JID library for Elixir"
  end

  defp deps do
    [
      # Docs deps
      {:ex_doc, "~> 0.18", only: :dev},

      # Test deps
      {:excoveralls, "~> 0.8", only: :test}]
  end

  defp docs do
    [extras: docs_extras(),
     main: "readme"]
  end

  defp docs_extras do
    ["README.md"]
  end

  defp package do
    [files: ["lib", "mix.exs", "README.md", "LICENSE"],
       maintainers: ["Sonny Scroggin", "Simon Paitrault"],
       licenses: ["MIT"],
       links: %{"GitHub" => "https://github.com/Freyskeyd/jid"}]
  end
end

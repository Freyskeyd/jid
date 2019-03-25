defmodule Jid.MixProject do
  use Mix.Project

  @version "0.1.4"

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

  defp description do
    "A JID library for Elixir"
  end

  defp deps do
    [
      {:jason, "~> 1.0"},
      # Docs deps
      {:ex_doc, "~> 0.19", only: :dev},

      # Test deps
      {:excoveralls, "~> 0.10", only: :test}]
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

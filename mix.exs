defmodule GoogleProtos.MixProject do
  use Mix.Project

  @version (case File.read("VERSION") do
    {:ok, version} -> String.trim(version)
    {:error, _} -> "0.0.0-development"
  end)

  def project do
    [
      app: :google_protos,
      name: "Google Protos",
      version: @version,
      elixir: "~> 1.4",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "Protos by Google",
      package: package(),
      # docs
      name: "Exlnd",
      source_url: "https://github.com/coingaming/google-protos",
      homepage_url: "https://github.com/coingaming/google-protos/tree/v#{@version}",
      docs: [
        source_ref: "v#{@version}"
      ]
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:protobuf, "~> 0.9", organization: "coingaming"},
      {:ex_doc, ">= 0.0.0", only: [:dev, :test], runtime: false},
    ]
  end

  defp package do
    [
      organization: "coingaming",
      maintainers: ["Tony Han"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/coingaming/google-protos/tree/v#{@version}"},
      files: ~w(mix.exs README.md lib config LICENSE)
    ]
  end
end

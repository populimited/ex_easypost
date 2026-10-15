defmodule EasyPost.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_easypost,
      version: "3.0.4",
      elixir: "~> 1.20",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:crypto, :logger]
    ]
  end

  defp deps do
    [
      #
      # dev
      #

      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:req, "~> 0.7"}
    ]
  end

  defp dialyzer do
    [
      plt_core_path: "_build/#{Mix.env()}"
    ]
  end

  defp package do
    [
      description: "Elixir client for the EasyPost API",
      maintainers: ["Anthony Smith"],
      licenses: ["MIT"],
      links: %{
        GitHub: "https://github.com/sticksnleaves/ex_easypost"
      }
    ]
  end
end

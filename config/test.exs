import Config

# 在測試期間僅打印警告和錯誤

config :logger, :console, level: :warn

config :logger, :ecto,
  level: :warn,
  path: Path.absname("logs/test/ecto.log")

config :logger, :error, path: Path.absname("logs/test/error.log")

config :explorer, Explorer.ExchangeRates,
  source: Explorer.ExchangeRates.Source.NoOpSource,
  store: :none

config :explorer, Explorer.KnownTokens, store: :none

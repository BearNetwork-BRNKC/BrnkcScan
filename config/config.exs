# 這個文件負責配置你的應用
# 及其在 Config 模塊的幫助下的依賴關係。
import Config

# 默認情況下，傘式項目以及每個孩子
# 應用程序需要這個配置文件，確保
# 他們都使用相同的配置。雖然可以
# 在這裡配置所有應用程序，我們更喜歡委託
# 回到每個應用程序以進行組織。
for config <- "../apps/*/config/config.exs" |> Path.expand(__DIR__) |> Path.wildcard() do
  import_config config
end

config :phoenix, :json_library, Jason

config :logger,
  backends: [
    # all applications and all levels
    :console,
    # all applications, but only errors
    {LoggerFileBackend, :error},
    # only :ecto, but all levels
    {LoggerFileBackend, :ecto},
    # only :block_scout_web, but all levels
    {LoggerFileBackend, :block_scout_web},
    # only :ethereum_jsonrpc, but all levels
    {LoggerFileBackend, :ethereum_jsonrpc},
    # only :explorer, but all levels
    {LoggerFileBackend, :explorer},
    # only :indexer, but all levels
    {LoggerFileBackend, :indexer},
    {LoggerFileBackend, :indexer_token_balances},
    {LoggerFileBackend, :token_instances},
    {LoggerFileBackend, :reading_token_functions},
    {LoggerFileBackend, :pending_transactions_to_refetch},
    {LoggerFileBackend, :empty_blocks_to_refetch},
    {LoggerFileBackend, :api},
    {LoggerFileBackend, :block_import_timings},
    {LoggerFileBackend, :account}
  ]

config :logger, :console,
  # 對所有記錄器使用相同的格式，即使 `:error` 後端的級別應該永遠是 `:error`
  format: "$dateT$time $metadata[$level] $message\n",
  metadata:
    ~w(application fetcher request_id first_block_number last_block_number missing_block_range_count missing_block_count
       block_number step count error_count shrunk import_id transaction_id)a

config :logger, :ecto,
  # 對所有記錄器使用相同的格式，即使 `:error` 後端的級別應該永遠是 `:error`
  format: "$dateT$time $metadata[$level] $message\n",
  metadata:
    ~w(application fetcher request_id first_block_number last_block_number missing_block_range_count missing_block_count
       block_number step count error_count shrunk import_id transaction_id)a,
  metadata_filter: [application: :ecto]

config :logger, :error,
  # 對所有記錄器使用相同的格式，即使 `:error` 後端的級別應該永遠是 `:error`
  format: "$dateT$time $metadata[$level] $message\n",
  level: :error,
  metadata:
    ~w(application fetcher request_id first_block_number last_block_number missing_block_range_count missing_block_count
       block_number step count error_count shrunk import_id transaction_id)a

# 導入特定於環境的配置。這必須保留在底部
# 這個文件，所以它會覆蓋上面定義的配置。
import_config "#{config_env()}.exs"

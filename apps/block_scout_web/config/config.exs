# 這個文件負責配置你的應用
# 及其在 Config 模塊的幫助下的依賴關係。
#
# 這個配置文件在任何依賴和之前被加載
# 僅限於此項目。
import Config

network_path =
  "NETWORK_PATH"
  |> System.get_env("/")
  |> (&(if String.ends_with?(&1, "/") do
          String.trim_trailing(&1, "/")
        else
          &1
        end)).()

api_path =
  "API_PATH"
  |> System.get_env("/")
  |> (&(if String.ends_with?(&1, "/") do
          String.trim_trailing(&1, "/")
        else
          &1
        end)).()

#一般應用配置
config :block_scout_web,
  namespace: BlockScoutWeb,
  ecto_repos: [Explorer.Repo, Explorer.Repo.Account],
  cookie_domain: System.get_env("SESSION_COOKIE_DOMAIN")

config :block_scout_web,
  admin_panel_enabled: System.get_env("ADMIN_PANEL_ENABLED", "") == "true"

config :block_scout_web, BlockScoutWeb.Counters.BlocksIndexedCounter, enabled: true

config :block_scout_web, BlockScoutWeb.Counters.InternalTransactionsIndexedCounter, enabled: true

# 配置端點
config :block_scout_web, BlockScoutWeb.Endpoint,
  url: [
    path: network_path,
    api_path: api_path
  ],
  render_errors: [view: BlockScoutWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: BlockScoutWeb.PubSub

config :block_scout_web, BlockScoutWeb.Tracer,
  service: :block_scout_web,
  adapter: SpandexDatadog.Adapter,
  trace_key: :blockscout

# 配置gettext
config :block_scout_web, BlockScoutWeb.Gettext, locales: ~w(en), default_locale: "en"

config :block_scout_web, BlockScoutWeb.SocialMedia,
  twitter: "CT_BearNetwork",
  telegram: "bearnetwork",
  facebook: "bearnetwork.net",
  instagram: "bearnetwork.net"

config :block_scout_web, BlockScoutWeb.Chain.TransactionHistoryChartController,
  # days
  history_size: 30

config :ex_cldr,
  default_locale: "en",
  default_backend: BlockScoutWeb.Cldr

config :logger, :block_scout_web,
  # keep synced with `config/config.exs`
  format: "$dateT$time $metadata[$level] $message\n",
  metadata:
    ~w(application fetcher request_id first_block_number last_block_number missing_block_range_count missing_block_count
       block_number step count error_count shrunk import_id transaction_id)a,
  metadata_filter: [application: :block_scout_web]

config :prometheus, BlockScoutWeb.Prometheus.Instrumenter,
  # 覆蓋 Phoenix 1.4 兼容性的默認值
  # * `:transport_name` to `:transport`
  # * remove `:vsn`
  channel_join_labels: [:channel, :topic, :transport],
  # 覆蓋 Phoenix 1.4 兼容性的默認值
  # * `:transport_name` to `:transport`
  # * remove `:vsn`
  channel_receive_labels: [:channel, :topic, :transport, :event]

config :spandex_phoenix, tracer: BlockScoutWeb.Tracer

config :wobserver,
  # 只返回本地節點
  discovery: :none,
  mode: :plug

config :block_scout_web, BlockScoutWeb.ApiRouter,
  writing_enabled: System.get_env("DISABLE_WRITE_API") != "true",
  reading_enabled: System.get_env("DISABLE_READ_API") != "true",
  wobserver_enabled: System.get_env("WOBSERVER_ENABLED") == "true"

config :block_scout_web, BlockScoutWeb.WebRouter, enabled: System.get_env("DISABLE_WEBAPP") != "true"

config :block_scout_web, BlockScoutWeb.CSPHeader,
  mixpanel_url: System.get_env("MIXPANEL_URL", "https://api-js.mixpanel.com"),
  amplitude_url: System.get_env("AMPLITUDE_URL", "https://api2.amplitude.com/2/httpapi")

#配置 Ueberauth 本地設置
config :ueberauth, Ueberauth,
  providers: [
    auth0: {
      Ueberauth.Strategy.Auth0,
      [callback_path: "/auth/auth0/callback", callback_params: ["path"]]
    }
  ]

config :hammer,
  backend: {Hammer.Backend.ETS, [expiry_ms: 60_000 * 60 * 4, cleanup_interval_ms: 60_000 * 10]}

# 導入特定於環境的配置。這必須保留在底部
# 這個文件，所以它會覆蓋上面定義的配置。
import_config "#{config_env()}.exs"

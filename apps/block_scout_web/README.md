# BlockScout 網站

這是一個用於從網絡瀏覽器檢查和分析 POA 網絡區塊鏈的工具。

## Machine Requirements

* Erlang/OTP 21+
* Elixir 1.9+
* Postgres 10.3

## 所需帳戶

* Github for code storage

## 安裝說明

### 發展

要在本地啟動和運行 BlockScout Web 界面：

*設置`../explorer`
*使用 `$ cd assets && npm install && cd ..` 安裝 Node.js 依賴項
*使用`$ mix phx.server`啟動Phoenix（可以從這個目錄或項目根目錄運行：推薦項目根目錄。）

現在您可以從瀏覽器訪問 [`localhost:4000`](http://localhost:4000)。

您還可以運行 IEx（Interactive Elixir）：`$ iex -S mix phx.server`（可以從該目錄或項目根目錄運行：推薦項目根目錄。）

### Testing

*構建資產：`cd assets && npm run build`
*格式化 Elixir 代碼：`mix format`
*Lint Elixir 代碼：`mix credo --strict`
*運行透析器：`mix dialyzer --halt-exit-status`
*檢查 Elixir 代碼是否存在漏洞：`mix sobelow --config`
*更新翻譯模板和翻譯並檢查沒有未提交的更改：`mix gettext.extract --merge`
*Lint JavaScript 代碼：`cd assets && npm run eslint`

## 國際化

該應用程序目前已國際化。它僅本地化為美國英語。

要翻譯新字符串，請運行“$ mix gettext.extract --merge”並在“priv/gettext/en/LC_MESSAGES/default.po”中編輯新字符串。

## Contributing

1. 分叉 ( <https://github.com/blockscout/blockscout/fork> )
2. 創建你的功能分支（`git checkout -b my-new-feature`）
3. 編寫涵蓋你工作的測試
4. 提交您的更改（`git commit -am 'Add some feature'`）
5. 推送到分支（`git push origin my-new-feature`）
6. 創建一個新的合併請求
7. 使用 PR 的鏈接和更改說明更新 CHANGELOG.md

### General

*提交應該是一個邏輯更改，仍然允許所有測試通過。如果可以有兩級邏輯分組，則更喜歡較小的提交。目標是讓未來的貢獻者（包括你自己未來的自己）確定你進行更改的理由，並允許他們挑選、修補或將這些更改隔離地移植到其他分支或分支。
*如果在您的 PR 期間您揭示了一個預先存在的錯誤：
1. 盡量隔離bug，在獨立的分支上修復，先PR。
  2. 嘗試在與其他更改分開的提交中修復錯誤：
     1.提交最初暴露錯誤的破壞狀態的代碼
     2.提交錯誤的修復。
     3. 繼續原來的公關工作。

### Enhancements

增強功能涵蓋了讓用戶生活更美好的所有變化：

* [作為問題提交的功能請求](https://github.com/blockscout/blockscout/labels/enhancement) that impact end-user [contributors](https://github.com/blockscout/blockscout/labels/contributor) and [developers](https://github.com/blockscout/blockscout/labels/developer)
* 更改為 [建築學](https://github.com/blockscout/blockscout/labels/architecture) 讓貢獻者（在 GitHub 意義上）、開發人員和部署人員更容易維護和運行 blockscout

### Bug Fixes

對於錯誤修復，只要有可能，應該至少有 2 次提交：

1. 回歸測試提交，其中包含演示錯誤並顯示為失敗的測試。
2. 顯示回歸測試現在通過的錯誤修復提交。

這種格式確保我們可以運行測試來重現原始錯誤，而不依賴於修復中的新代碼，這可能會導致測試錯誤地通過。

### Incompatible Changes

不兼容的更改可能會作為增強功能或錯誤修復的副作用出現。在增強期間，可能會發生不兼容的更改，因為例如，為了支持向最終用戶顯示新數據，可能需要更改數據庫架構並從頭開始重建索引。在錯誤修復期間，可能會發生不兼容的更改，因為為了修復錯誤，架構必須更改，或者某些內部 API 的調用方式已更改。
*應明確指出不兼容的更改，以及各種用戶角色需要執行升級的任何步驟。
*如果發生需要重新索引的架構更改，請將以下內容添加到合併請求描述中：

  ```markdown
  **NOTE**: 需要重置數據庫並重新編制索引
  ```

### Pull Request

There is a [PULL_REQUEST_TEMPLATE.md](PULL_REQUEST_TEMPLATE.md) for this repository, but since it can't fill in the title for you, please follow the following steps when opening a Pull Request before filling in the template:

* [ ] Title
  * [ ] Prefix labels if you don't have permissions to set labels in the GitHub interface.
  * (bug) for [bug](https://github.com/blockscout/blockscout/labels/bug) fixes
  * (enhancement) for [enhancement](https://github.com/blockscout/blockscout/labels/enhancement)s
  * (incompatible changes) for [incompatible changes](https://github.com/blockscout/blockscout/labels/incompatible%20changes), such a refactor that removes functionality, changes arguments, or makes something required that wasn't previously.
  * [ ] Single sentence summary of change
    * What was fixed for bugs
    * What was added for enhancements
    * What was changed for incompatible changes

See [#255](https://github.com/blockscout/blockscout/pull/255) as an example PR that uses GitHub keywords and a Changelog to explain multiple changes.

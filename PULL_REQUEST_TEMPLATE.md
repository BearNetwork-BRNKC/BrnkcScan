*[用於關閉任何相關問題的 GitHub 關鍵字](https://blog.github.com/2013-05-14-closing-issues-via-pull-requests/)*

## Motivation

*為什麼我們應該合併這些更改。如果使用 GitHub 關鍵字關閉[問題](https://github.com/poanetwork/blockscout/issues)，這是可選的，因為可以在問題頁面上閱讀動機。*

## Changelog

### Enhancements
*你添加的東西不會破壞任何東西。錯誤修復的回歸測試算作增強.*

### Bug Fixes
*你改變的東西修復了錯誤。如果修復了錯誤，但這樣做會增加新要求、刪除代碼或需要重置數據庫和重建索引，則更改的中斷部分也應添加到下面的不兼容更改中.*

### Incompatible Changes
*您在執行增強功能和錯誤修復時損壞的東西。重大更改包括 (1) 添加新要求和 (2) 刪除代碼。重命名算作 (2)，因為重命名是先刪除再添加。*

## Upgrading

*如果您在上述更新日誌中有任何不兼容的更改，請概述在此 PR 發布後或審閱者在本地進行測試時，先前版本的用戶如何升級。一個常見的升級步驟是“需要重置數據庫和重新索引".*

## Checklist for your Pull Request (PR)

  - [ ] 我用這個 PR 向 `CHANGELOG.md` 添加了一個條目
  - [ ] 如果我添加了新功能，我會添加覆蓋它的測試。
  - [ ] 如果我修復了一個錯誤，我會添加一個回歸測試以防止錯誤再次悄無聲息地出現。
  - [ ] 我檢查了是否應該更新文檔，並通過向 https://github.com/blockscout/docs 提交 PR 來這樣做
  - [ ] 如果我添加/更改/刪除了 ENV var，我向 https://github.com/blockscout/docs 提交了 PR 以更新 https://github.com/blockscout/docs/blob/master/上的 env vars 列表for-developers/information-and-settings/env-variables.md 並且我在版本列中將版本更新為“master”。更改將反映在此表中：https://docs.blockscout.com/for-developers/information-and-settings/env-variables。
  - [ ] 如果我將新索引添加到數據庫中，我會檢查它們是否與 PGHero 或其他工具無關

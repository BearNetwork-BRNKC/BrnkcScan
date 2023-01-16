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

Enhancements cover all changes that make users lives better:

* [feature requests filed as issues](https://github.com/blockscout/blockscout/labels/enhancement) that impact end-user [contributors](https://github.com/blockscout/blockscout/labels/contributor) and [developers](https://github.com/blockscout/blockscout/labels/developer)
* changes to the [architecture](https://github.com/blockscout/blockscout/labels/architecture) that make it easier for contributors (in the GitHub sense), dev-ops, and deployers to maintain and run blockscout

### Bug Fixes

For bug fixes, whenever possible, there should be at least 2 commits:

1. A regression test commit that contains tests that demonstrate the bug and show as failing.
2. The bug fix commit that shows the regression test now passing.

This format ensures that we can run the test to reproduce the original bug without depending on the new code in the fix, which could lead to the test falsely passing.

### Incompatible Changes

Incompatible changes can arise as a side-effect of either Enhancements or Bug Fixes.  During Enhancements, incompatible changes can occur because, as an example, in order to support showing end-users new data, the database schema may need to be changed and the index rebuilt from scratch.  During bug fixes, incompatible changes can occur because in order to fix a bug, the schema had to change, or how certain internal APIs are called changed.

* Incompatible changes should be called out explicitly, with any steps the various user roles need to do to upgrade.
* If a schema change occurs that requires a re-index add the following to the Pull Request description:

  ```markdown
  **NOTE**: A database reset and re-index is required
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

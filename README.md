
# git-subcommand
開発作業の効率化を目的としたgitのコマンド拡張

# Requirement
* jq (version: 1.6)
  - https://stedolan.github.io/jq/
* GitLab API (version: 13.6.7)
  - https://docs.gitlab.com/ee/api/api_resources.html

# Installation

- MacOSの場合は以下コマンドでjqをあらかじめインストールする
```shell
brew install jq
```

- リポジトリからclone
```shell
# git clone & cd gitRoot
git clone git@github.com:kf-2020/git-subcommand-kf.git && cd $(basename $_ .git)
```

- 初期導入用シェル実行
```shell
./initialize.sh
```

# Usage

## git b
- `git branch`の省略版。
  ```shell
  $ git b

  develop
  * feature-kf-test-20240201
  feature-kf-test2-20240202
  ```

## git c
- `git checkout`の省略版。
  ```shell
  $ git c develop

  Switched to branch 'develop'
  Your branch is behind 'origin/develop' by 179 commits, and can be fast-forwarded.
  (use "git pull" to update your local branch)
  ```

## git cf
- cf: "checkout feature"
- 自身が持っているローカルブランチの中でキーワード検索し、ヒットしたブランチを自動的にチェックアウトする
    ```shell
    $ # 事前にブランチ一覧確認。今回は「layout-fix」で検索し、ヒットしたブランチをチェックアウトする
    $ git b
    * develop
    feature-kf-layout-test-20240201
    feature-kf-layout-fix-test-20240210

    $ # 「layout-fix」で検索し、「feature-kf-layout-fix-test-20240210」がヒット。
    $ git cf layout-fix
    ブランチ【 feature-kf-layout-fix-test-20240210 】をチェックアウトします。
    Switched to branch 'feature-kf-layout-fix-test-20240210'
    Your branch is up to date with 'origin/feature-kf-layout-fix-test-20240210'.

    $ # 上記ブランチがチェックアウトされていることを確認。
    $ git b
    develop
    * feature-kf-layout-fix-test-20240210
    feature-kf-layout-test-20240201
    ```

## git d
- `git branch -d`の省略版。ブランチの削除を実施する。
  ```shell
  $ # 事前にブランチ一覧確認。今回は「feature-kf-layout-test-20240201」をdeleteしてみる。
  $ git b
  * develop
    feature-kf-layout-test-20240201
  
  $ # 「feature-kf-layout-test-20240201」をdelete。
  $ git d feature-kf-layout-test-20240201
  Deleted branch feature-kf-layout-test-20240201 (was 34e125399cf).
  
  $ # deleteできていることを確認。
  $ git b
  * develop
  ```

## git diff-list
- `git diff origin/develop... --name-only` の省略版。
- 今いるブランチとdevelopとの差分をファイル一覧で出す。GitLabのマージリクエストで見てる内容をこのコマンドで実現。

## git p
- `git push` の省略版。(追跡ブランチの自動生成機能付き)
  ```shell
  $ # ローカルブランチを新しく作る
  $ git c -b feature-kf-layout-fix-test-20240210
  Switched to a new branch 'feature-kf-layout-fix-test-20240210'

  $ # そのままブランチをプッシュする
  $ # ※ この時、自動的に同名ブランチ名で追跡ブランチを作成する。( --set-upstream オプション)
  $ git p
  feature-kf-layout-fix-test-20240210 ブランチをpushします。よろしいですか？(y/n) : y
  $ # (中略)
  Branch 'feature-kf-test-20211203' set up to track remote branch 'feature-kf-test-20211203' from   'origin'.

  $ # develop/release/masterブランチに関してはメッセージを表示し、PUSHを禁止とする
  $ git p
  !!! push禁止ブランチです。## develop...origin/develop
  ```

## git todo
- 現在自身が開発しているブランチに残してある「todo」をリストアップします。
  ```shell
  $ git todo
   feature-kf-layout-fix-test-20240210 <---> origin/develop
  
  hoge/fuga.php:       // TODO nullだと<>ではぶられる
  hoge/piyo.php:       // @todo 仕様を精査。Stringにするか、定数値にしてIntとするか。
  
  ```

# Author
* 藤本 健太 (kenta.fujimoto.2020@gmail.com)

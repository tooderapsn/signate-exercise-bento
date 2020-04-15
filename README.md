# signate-exercise-bento
SIGNATE【練習問題】お弁当の需要予測を通して、データ分析プロジェクトの進め方等を訓練する。

https://signate.jp/competitions/24

## 環境構築

`docker-compose up -d --build`

インストール済みの環境の確認はDockerfileを参照する。

## ブランチ戦略
* 基本はgit-flow
* 例外
  * .ipynbのconflict問題を解決する方法がみつかるまでは、conflictを避けるため、やむを得ず下記のルールを適用する。
    * featureブランチにおいて、`git merge develop`(ローカルでfeartureにdevelopをマージする)はダメ。
    * 最新のdevelopの内容を取り入れたい場合
      * develoブランチにおいて、`git pull`で最新にする。
      * その状態で`git switch -c feature/#999_do_something`（`switch -c`は`checkout -b`と同じ）でブランチを切り直して、作業していたコードを貼り直す。
    * ※ リモートdevelopへの各作業者のfeatureのマージは各自の進捗を確認しながら適切なタイミングで行い、上記の作業をなるべく発生させないように注意する。
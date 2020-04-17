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
      * リモートdevelopへの各作業者のfeatureのマージは各自の進捗を確認しながら適切なタイミングで行い、上記の作業をなるべく発生させないように注意する。
* 作業フロー
  * developを最新にする。developブランチにおいて`git pull`
  * そこからfeatureブランチを切る。`git switch -c feature/#999_do_something`（`switch -c`は`checkout -b`と同じ）
    * Backlogのタスクの番号（必須）とタスク概要を`feature/#999_do_something`のように命名する。
  * 作業が完了したら、
    * Jupyter上でKernelを再起動して全てのセルを実行しなおし、データ部分での冪等性を確認する。
    * **自分が変更を加えた.ipynbにリモートのdevelopで変更がないかを確認する。**
      * 変更がない場合
        * `git push`　※ 初回は `git push --set-upstream origin feature/#999_do_something`が必要
      * 変更があった場合
        * developブランチにおいて、`git pull`で最新にする。
        * その状態で`git switch -c feature/#999_do_something_2`でブランチを切り直して、`#999_do_something`で作業していたコードをjupyter上で貼り直す。
  * github上でdevelopにプルリクエストを出す。
  * developにマージされたらBacklogのタスクを「完了」とする。
* 運用上のポイント
  * csvなどで中間ファイルとして吐き出しておくと、データに変更が合った場合にgitで検知できるので、作成した主要なデータについてはcsvファイルなどでリポジトリ内に永続化しておく。

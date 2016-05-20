# BASE POINT Original Working Cafe Point Getter

## What is this

* BASE POINTの会員サービスにログインしておみくじポイントを自動的に取得するための nightmare スクリプト

## 設定する環境変数について

* BASEPOINT\_USER
    * Base Point サイトのログインID

* BASEPOINT\_PASS
    * Base Point サイトのログインパスワード

* BASEPOINT\_SLACK\_NOTIFY\_TO
    * Slackの通知先チャンネルの指定(自分などのユーザーに通知したい場合 @ 付き、チャンネルなら # 付きにすること)

* BASEPOINT\_SLACK\_API\_ENDPOINT
    * Slackの通知するAPIエンドポイントの指定(Incoming Webhookで作成したURL)

## 動かし方

* `docker build -t <your container name> .`
* `docker run --rm -v <snapshotsavedir>:/home/node/app/build --env "BASEPOINT_USER=user@example.net" --env "BASEPOINT_PASS=password" --env "BASEPOINT_SLACK_API_ENDPOINT=https://hooks.slack.com/services/hoge/fuga/bar" --env 'BASEPOINT_SLACK_NOTIFY_TO=@me' <your container name>`

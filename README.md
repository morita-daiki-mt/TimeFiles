## TimeFiles
![スクリーンショット 2020-12-28 153838](https://user-images.githubusercontent.com/62919960/103194397-dc611e00-4922-11eb-91e8-07dc8178f778.png)
## 概要
「最後にしたのいつだっけ...」<br>
最後にタスクを行った日から何日経ったか、あなたの代わりに正確に管理するサービスです。<br>

## URL
https://timefiles-app.com<br>
ゲストログイン機能がございます。<br>
ヘッダー、もしくはトップページのリンクから、ワンクリックでアプリの機能をお試しできます。<br>

## 制作の意図
自転車の空気入れ、趣味のギターのメンテナンス、普段しない場所の掃除...<br>
わざわざ次回の予定をスケジュール帳に入れるまでもない、でも最後にいつ行ったか履歴は残したいタスクは意外と多いと思います。<br>
いつからしていないかが分かれば、放置していて気づいたときには手遅れ、使おうと思ったときに使えない状態になっている　等の防止にも役立つはずです。<br>
既存のカレンダーアプリやタスク管理アプリではそういった使い方に不向きなものが多く、専用のWebアプリも見当たりませんでした。<br>
趣味や私生活で、このようなアプリへの需要は私以外にも大きいと考え、このサービスを制作しました。<br>

## 使い方
新規タスクボタンを押してタスク名と最新の実行日を登録できます。<br>
作成したタスクの名前、もしくはshowボタンをクリックすると詳細ページにジャンプできます。<br>
ここでは過去の実行日を追加したり、アイコン変更、タスク名変更、メモの追加などが可能です。


## 機能一覧
- カレンダー機能<br>
  すべてのタスク実行履歴をカレンダーでかんたんに確認することができます。

- TODAY ボタン<br>
  ワンクリックで今日の日付をタスクに実行日として追加できるボタンを設置しています。

- アイコン機能<br>
  タスクのアイコンを自由に設定可能です。

- CSVエクスポート機能<br>
  タスク一覧ページから自分のタスクと履歴をエクスポートできます。

## Qiita
このアプリの製作中、導入してみてとても便利だと感じたflatpickrというGemについての記事がQiitaにあまりなかったので、アウトプットも兼ねて使い方等を記事にしてみました。<br>
Railsへの導入方法やカスタマイズ例などをまとめています。<br>
[Railsでflatpickrを使ってみる](https://qiita.com/morimorita/items/abf7f4278303f539e58b)

## インフラ構成図
![AWS](https://user-images.githubusercontent.com/62919960/103165810-8ecfad00-485f-11eb-9ceb-5fa622e2b570.png)

## 環境・使用技術
##### フロントエンド
- SCSS
- JavaSqript

##### バックエンド 
- Ruby ruby 2.6.6
- Rails 5.2.4.4

##### 開発環境
- PostgreSQL
- Puma

##### 本番環境
- AWS (VPC, EC2, RDS, IAM, Route53, ACM, ALB, S3, CloudFrot)
- PostgreSQL
- Nginx


##### その他使用技術
- Action Mailer
- capistrano
- carrierwave
- data-confirm-modal
- devise
- font-awesome-rails
- flatpickr (カレンダー機能)
- mini_magick
- Rubocop-airbnb
- simple_calendar

##### development
- pry-byebug
- RSpec
  - factory_bot_rails
  - faker
  - capybara
  - selenium-webdriver

- チーム開発を意識し、Trelloやgithubのプルリクなどを活用

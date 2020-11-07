# 概要
「最後にしたのいつだっけ...」
最後にタスクを行った日から何日経ったか、あなたの代わりに正確に管理するサービスです。

# URL
http://54.168.27.112/
ゲストログイン機能がございます。
ヘッダー、もしくはトップページのリンクから、ワンクリックでアプリの機能をお試しできます。

# 制作の意図
自転車の空気入れ、趣味のギターのメンテナンス、普段しない場所の掃除...
わざわざ次回の予定をスケジュール帳に入れるまでもない、でも最後にいつ行ったか履歴は残したいタスクは意外と多いと思います。
いつからしていないかが分かれば、放置していて気づいたときには手遅れ、使おうと思ったときに使えない状態になっている　等の防止にも役立つはずです。
既存のカレンダーアプリやタスク管理アプリではそういった使い方に不向きなものが多く、専用のWebアプリも見当たりませんでした。
趣味や私生活で、このようなアプリへの需要は私以外にも大きいと考え、このサービスを制作しました。

# 機能一覧
- カレンダー機能
  すべてのタスク実行履歴をカレンダーでかんたんに確認することができます。

- TODAY ボタン
  ワンクリックで今日の日付をタスクに実行日として追加できるボタンを設置しています。

- アイコン機能
  タスクのアイコンを自由に設定可能です。

# 環境・使用技術
* フロントエンド
- SCSS
- JavaSqript

* バックエンド 
- Ruby ruby 2.6.6
- Rails 5.2.4.4

* 開発環境
- PostgreSQL

* 本番環境
- AWS (EC2, RDS for PostgreSQL, IAM )
- PostgreSQL
- Ngix, Unicorn

* インフラ構成図

* その他使用技術
- Action Mailer
- bootstrap4-datetime-picker-rails
- carrierwave
- data-confirm-modal
- devise
- font-awesome-rails
- mini_magick
- Rubocop-airbnb
- simple_calendar

development
- pry-byebug
- RSpec
  - factory_bot_rails
  - faker
  - capybara
  - selenium-webdriver

- チーム開発を意識し、Trelloやgithubのプルリクなどを活用
# README

#### なぜアプリを作ったか？
私は先延ばし癖があり、その状態を改善するためです。
先延ばし癖の原因は、「①１日のやることを決めずに漠然と過ごしてしまう。」、
「②後回しにして忘れてしまう。」の2点であると考えました。
①②それぞれの解決方法があります。
①の場合、「To Doリストを作り１日の予定を明確にする。」ことで解決できます。
②の場合、「予定に時間を組み込み、誰かが予定の催促をする。」ことで解決できます。
これらの解決方法を手軽にできるようにしたいと思い、このアプリを作成しました。

#### アプリの使い方
①ログインまたはサインアップをします。
<img width="1438" alt="スクリーンショット 2023-03-09 15 52 59" src="https://user-images.githubusercontent.com/97649701/223947579-79d784f4-59e5-4a9a-8f51-391a6c760814.png">
② ログイン後、マイページに遷移されます。LINE通知機能を使用する場合、LINE連携するをクリックしてください。
<img width="1440" alt="スクリーンショット 2023-03-09 15 54 24" src="https://user-images.githubusercontent.com/97649701/223947912-288e4666-7033-482f-8f3e-eb8d63d624b7.png">
③ToDoを投稿するためには、ToDoMailerをクリックして、ToDo投稿をクリックしてください。
<img width="1440" alt="スクリーンショット 2023-03-09 15 55 20" src="https://user-images.githubusercontent.com/97649701/223948486-61bfbfe9-5a10-4d80-9696-d3807519fe0b.png">
④ToDoを投稿することができます。
<img width="1440" alt="スクリーンショット 2023-03-09 15 58 50" src="https://user-images.githubusercontent.com/97649701/223948982-3c6bf080-cb05-47ce-a753-0c7c9de568e7.png">
⑤編集をクリックするとToDoを編集することができます。
<img width="1440" alt="スクリーンショット 2023-03-09 16 00 36" src="https://user-images.githubusercontent.com/97649701/223951036-5c92c875-4ce5-4bd9-bd92-588e66913f66.png">

⑥予定の日時になっても、ToDoを実施に編集されていないと、LINE or メールまたはその両方から通知されます。
※LINEログインを用いて、アカウントを作成された方は、メールアドレスを編集しなければメール通知が利用できません。
#### 開発言語
- Back End
  - ruby 3.0.1
  - rails 6.1.7
  - Nginx
  - Unicorn
- Front End
  - HTML
  - CSS
  - JQuery
  - Bootstrap
- Infra
  - AWS(VPC,EC2,EIP)
- DB
  - PostgreSQL

#### 機能
- サインアップ、ログイン、ログアウト、ユーザー削除
- 管理者機能
- 定時処理
- 投稿検索機能
- LINEログイン
- LINE通知
- ページネーション
- カレンダー機能
- メール機能(gmail)
- 投稿機能(ajax)
- タグ作成機能(ajax)

#### 機能で使用したgem
- サインアップ、ログイン、ログアウト、ユーザー削除
  - devise
- 管理者機能
  - rails_admin
  - cancancan
- 定時処理
  - whenever
- 投稿検索機能
  - ransack
- LINEログイン
  - omniauth-line'
  - omniauth-rails_csrf_protection
- line通知
  - line-bot-api
- ページネーション
  - kaminari
- カレンダー
  - simple_calendar


#### 実行手順
```
$ git clone git@github.com:t-yamaishi/to_do_app.git
$ cd to_do_app
$ bundle install
$ rails db:create && $ rails db:migrate
$ rails s
```
#### テーブル定義書
https://docs.google.com/spreadsheets/d/1cX7DUhu9WbYw7zI-S3J0ci6HaV9CQ8aYNM37ZBZuWnE/edit#gid=1775028168

#### ER図
<img width="783" alt="スクリーンショット 2023-03-09 12 30 11" src="https://user-images.githubusercontent.com/97649701/223909706-3977e1c6-f5fb-4701-8024-180fcd9f2e3b.png">

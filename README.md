# schedule_management_app

## taskモデル
|カラム名|データ型|
|---|---|
|id|integer|
|end_time|datetime|
|priority|integer|
|status|string|
|memo|text|

## labelモデル
|カラム名|データ型|
|---|---|
|id|integer|
|label_color|string|

## userモデル
|カラム名|データ型|
|---|---|
|id|integer|
|user_id|integer|
|password|string|

# herokuへのデプロイ手順
開発環境<br>
ruby 2.6.4<br>
Rails 5.2.3<br>
psql (PostgreSQL) 11.3<br>
1. Herokuへの登録する
2. Herokuをインストールする(Macの場合)
```$ brew tap heroku/brew && brew install heroku```
3. Herokuにログインする
```$ heroku login```
4. Heroku上にアプリケーションを作成する
```$ heroku create```
5. Herokuへデプロイする
```$ git push heroku master```
6. DBのマイグレーションを行う
```$ heroku run rails db:migrate```
<br>GitHubと連携させている場合は、下記コマンドで自動でHerokuのビルドが実行されます<br>
```$ git push origin master```
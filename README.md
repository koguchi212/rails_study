# 目標管理アプリ
## 手順
1. Docker Desktopのインストール
2. コンテナのビルド
   ```bash
   docker compose build
   ```
3. コンテナの起動
   ```bash
   docker compose up -d
   ```
4. DBの作成
   ```bash
    docker compose exec web rails db:create
    ```

5. マイグレーションの実行
    ```bash
    docker compose exec web rails db:migrate
    ```

6. seedデータの投入
   ```bash
    docker compose exec web rails db:seed
    ```
7. ログイン画面の表示
   ```bash
    http://localhost:4000/admin/users
    ```
8. emailとpasswordを入力
   seedデータではemail:admin@example.com, password:password

## mailerのチェック
- 新規作成して、登録したときにメール送信処理を走らせるようにしました
- (http://localhost:1080)にアクセスすると動作確認できます
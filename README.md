# アプリ名
- BUILD UP

# 概要
- ユーザー登録機能
- 記録投稿機能
- 記録詳細機能
- 記録編集機能
- 記録削除機能
- 記録検索機能
- 記録へコメント
- 記録のお気に入り機能
- ページネーション
- マイページ（自分が投稿した記録を確認できる）
- 投稿者ごとの記録閲覧


# 本番環境
https://build-up-32508.herokuapp.com/
- admin:
- password: 
- Eメール:a11111@com
- パスワード:a11111

# 制作背景（意図）
私自身、Jリーグのクラブやタウンクラブでサッカーの指導者として活動していました。その中で感じていたある課題を少しでも解決したいと思い、制作をいたしました。  
その課題とは、「練習計画をする指導者は多いが、自分自身の指導に関してフィードバックをする指導者が少ない」というものです。  
そこで、今回作成したアプリでは、簡単なフォーマットに沿って入力するだけで、練習内容などを記録できるアプリを制作いたしました。

# DEMO
## トップページ
## 新規登録
[![Image from Gyazo](https://i.gyazo.com/8b6f6a00cf03e55c759f6f71b9dd57f0.gif)](https://gyazo.com/8b6f6a00cf03e55c759f6f71b9dd57f0)
ユーザーを新規登録するページです。  
ニックネーム、メールアドレス、パスワード、誕生日、氏名（全角・全角カナ）の情報を記入すると、新規登録ができます。

## ログインページ
[![Image from Gyazo](https://i.gyazo.com/1ad91e03aa791621171522a9d842689b.gif)](https://gyazo.com/1ad91e03aa791621171522a9d842689b)

ログインページです。  
メールアドレスとパスワードを入力するとログインできます。

## 記録投稿ページ
[![Image from Gyazo](https://i.gyazo.com/f228e5b7f1a69444a9086626d59e1267.gif)](https://gyazo.com/f228e5b7f1a69444a9086626d59e1267)

練習した内容などを記録するページです。 
練習テーマや練習した競技など簡単なフォーマットに沿って入力することで、簡単に投稿することができます。また、写真を１枚投稿することで、視覚的にその日の状況や気持ちも思い出す事ができるようにしています。

## 記録詳細ページ・編集/削除機能
[![Image from Gyazo](https://i.gyazo.com/0e1c9c4321501bb83e8c7d2cd42763a6.gif)](https://gyazo.com/0e1c9c4321501bb83e8c7d2cd42763a6)

投稿された記録の詳細ページです。  
投稿された記事を押すと、詳細ページへ遷移されます。詳細ページでは、投稿時に入力したデータが反映され、記録を確認することができます。また、詳細ページにて編集や削除も可能です。



## 記録検索機能
[![Image from Gyazo](https://i.gyazo.com/fe2d0c58979451c98a83f71ea79e1d94.gif)](https://gyazo.com/fe2d0c58979451c98a83f71ea79e1d94)

投稿された記事を検索する機能です。  
ヘッダーから種目名を入力すると、種目ごとの記録が一覧表示されます。記録をクリックすると、その記録の詳細ページへ遷移します。

## コメント機能
[![Image from Gyazo](https://i.gyazo.com/c7118d48b41cfeab92a0ccfefdd789b5.gif)](https://gyazo.com/c7118d48b41cfeab92a0ccfefdd789b5)

投稿された記事へのコメント機能です。  
ログインしているユーザーのみ、コメント可能です。また、コメントしたユーザーのみ、コメントを削除することができます。

## お気に入り機能
[![Image from Gyazo](https://i.gyazo.com/56ce18bd2aa0f53b4fef85af37af6521.gif)](https://gyazo.com/56ce18bd2aa0f53b4fef85af37af6521)

投稿記録にお気に入り登録できる機能です。
ログインしているユーザーのみ、お気に入り登録が可能です。解除機能も合わせて実装しております。



# 工夫した点
- 投稿内容をシンプルにすることで、気軽に利用できるように作成しました。  
- エラーの表記を日本語にすることで、どこの項目の入力が足りないのか簡単に把握できるように実装しました。
- 投稿内容に誰か一人褒める内容（MVP)を追加することで、前向きなフィードバックを無意識にするように実装しました。
- ページネーションを利用することで、投稿された記録がすっきりと表示されるように実装しました。

# 使用技術(開発環境)
## バックエンド
Ruby, Ruby on Rails
## フロントエンド
Html,css,scss,Bootstrap,JavaScript

# ソース管理
GitHub,GitHubDesktop

# テスト
RSpec

# エディタ
VSCode

# 課題や今後実装したい内容
- サインアップ時、SNS認証画で未実装なので、利便性を考え、追加したいと考えています。
- 練習記録だけでなく、日記のような違う内容も投稿ができるよう考えております。
- 投稿者の記録の積立が可視化できるよう、投稿者のマイページの変更を考えております。
- 同期通信で実装している場面が多いので,利便性を考慮し、Ajaxで実装できるよう変更していきます。  






# DB設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false,              |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| family_name        | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association
- has_many :records
- has_many :comments


## records テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| tr_theme         | string     | null: false                    |
| tr_day           | date       | null: false                    |
| category_id      | integer    | null: false                    |
| tr_content       | text       | null: false                    |
| mvp              | string     | null: false                    |
| mvp_reason       | text       | null: false                    |
| event            | string     | null: false                    |
| evaluation_id    | integer    | null: false                    |
| user             | references | foreign_key: true              |

### Association

- belongs_to :user
- has_many :comments



## comment テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | foreign_key: true              |
| record  | references | foreign_key: true              |

### Association

- belongs_to :user
- belongs_to :record

## like テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | foreign_key: true              |
| record  | references | foreign_key: true              |

### Association

- belongs_to :user
- belongs_to :record

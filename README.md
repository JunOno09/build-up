# BUILD-UP テーブル設計

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
## usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birthday           | date    | null: false               |

### Association
- has_many :items
- has_many :comments
- has_many :orders

## itemsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| title             | string     | null: false                    |
| description       | text       | null: false                    |
| price             | integer    | null: false                    |
| category_id       | integer    | null: false                    |
| state_id          | integer    | null: false                    |
| delivery_price_id | integer    | null: false                    |
| delivery_date_id  | integer    | null: false                    |
| prefecture_id     | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |


## commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |


## ordersテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |


## addressesテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| zip_code       | string     | null: false                    |
| municipality   | string     | null: false                    |
| address_number | string     | null: false                    |
| building_name  | string     |                                |
| tel_number     | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| order          | references | null: false, foreign_key: true |

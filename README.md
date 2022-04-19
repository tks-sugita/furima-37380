## usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| name               | string  | null: false               |
| name_kana          | string  | null: false               |
| birthday           | date    | null: false               |

### Association
- has_many :items
- has_many :comments
- has_many :orders
<br><br>

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

### Association
- belongs_to :user
- has_many :comments
- has_many :orders
- belongs_to :category
- belongs_to :state
- belongs_to :delivery_price
- belongs_to :delivery_date
- belongs_to :prefecture
- has_one_attached :image
<br><br>

## commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :comment
<br><br>

## ordersテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| zip_code       | string     | null: false                    |
| municipality   | string     | null: false                    |
| address_number | string     | null: false                    |
| building_name  | string     | null: true                     |
| tel_number     | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association
- belongs_to :prefecture
- belongs_to :user
- belongs_to :item
<br><br>

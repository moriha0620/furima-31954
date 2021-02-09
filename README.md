
# テーブル設計

## users テーブル

| Column                          | Type    | Options                   |
| ------------------------------- | ------  | ------------------------- |
| nickname                        | string  | null: false               |
| email                           | string  | null: false, unique: true |
| encrypted_password              | string  | null: false               |
| last_name                       | string  | null: false               |
| first_name                      | string  | null: false               |
| last_name_kana                  | string  | null: false               |
| first_name_kana                 | string  | null: false               |
| birthday                        | date    | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| product_name           | string     | null: false                    |
| product_description    | text       | null: false                    |
| category_id            | integer    | null: false                    |
| product_condition_id   | integer    | null: false                    |
| delivery_fee_id        | integer    | null: false                    |
| delivery_area_id       | integer    | null: false                    |
| delivery_day_id        | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs to :user
- has_one :purchase 

## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## destinations テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| delivery_area_id | integer    | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| bill             | string     |                                |
| phone_number     | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

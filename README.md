
# テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------  | ----------- |
| name                  | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| name                  | string  | null: false |
| name_kana             | string  | null: false |
| birthday              | integer | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| product_name           | string     | null: false                    |
| product_description    | text       | null: false                    |
| category               | string     | null: false                    |
| product_condition      | string     | null: false                    |
| delivery_fee           | string     | null: false                    |
| delivery_area          | string     | null: false                    |
| delivery_days          | string     | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

- belongs to :user
- has_one :purchase 

## purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_number   | integer    | null: false                    |
| expiration    | integer    | null: false                    |
| security_code | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## destinations テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefectures  | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| bill         | string     | null: false                    |
| phone_number | integer    | null: false                    |
| purchase     | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

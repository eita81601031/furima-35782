# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association
- has_many :items
- has_many :orders

## itemsテーブル

| Column             | Type   | Options                                         |
| ------------------ | ------ | ----------------------------------------------- |
| product_name       | string     | null: false                                 |
| description        | string     | null: false                                 |
| category           | string     | null: false                                 |
| status             | string     | null: false                                 |
| shipping_cost      | integer    | null: false                                 |
| prefecture         | string     | null: false                                 |
| shipping           | string     | null: false                                 |
| price              | integer    | null: false                                 |
| user_id            | references | null: false,foreign_key: true               |

### Association
- belongs_to :user
- has_one :order

## ordersテーブル

| Column             | Type       | Options                                         |
| ------------------ | ---------- | ----------------------------------------------- |
| user_id            | references | null: false,foreign_key: true                   |
| item_id            | references | null: false,foreign_key: true                   |

### Association
- belongs_to :user
- belongs_to :item
- has_one :information

## informationテーブル

| Column             | Type       | Options                                         |
| ------------------ | ---------- | ----------------------------------------------- |
| post_code          | integer    | null: false                                     |
| prefecture         | string     | null: false                                     |
| city               | string     | null: false                                     |
| address            | string     | null: false                                     |
| building           | string     | null: false                                     |
| phone              | integer    | null: false                                     |
| order_id           | references | null: false,foreign_key: true                   |

### Association
- belongs_to :item

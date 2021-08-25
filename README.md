# テーブル設計

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |

### Association

- has_many :items
- has_one :bayer

## buyersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------  | ------------------------------ |
| user_id            | references | null: false, foreign_key: true |
| post_code          | string     | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |

### Association

- belongs_to :user

## ordersテーブル

| Column             | Type       | Options                         |
| ------------------ | ---------  | --------------------------------|
| user_id            | references | null: false, foreign_key: true  |
| item_id            | references | null: false, foreign_key: true  |

### Association

- belongs_to :user

## categoryテーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| name               | string  | null: false |
| ancestry           | string  |             |

### Association

has_many :items

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | integer    | null: false                    |
| prefecture         | string     | null: false                    |
| description        | text       | null: false                    |
| status_id          | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_id        | integer    | null: false                    |
| judgment           | string     |                                |
| category_id        | integer    | null: false                    |
| brand_id           | integer    | null: false                    |
| user_id            | integer    | null: false                    |

### Association
- belongs_to :user dependent: :destroy
- belongs_to :category dependent: :destroy
- belongs_to :brand dependent: :destroy
- has_many :images dependent: :destroy

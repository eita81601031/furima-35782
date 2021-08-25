# テーブル設計

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |

### Association

- has_many :items
- has_one :bayer

## bayerテーブル

| Column             | Type    | Options                        |
| ------------------ | ------  | ------------------------------ |
| user_id            | integer | null: false, foreign_key: true |
| family_name        | string  | null: false                    |
| first_name         | string  | null: false                    |
| family_name_kana   | string  | null: false                    |
| first_name_kana    | string  | null: false                    |
| post_code          | string  | null: false                    |
| prefecture         | string  | null: false                    |
| city               | string  | null: false                    |
| address            | string  | null: false                    |
| building_name      | string  |                                |
| phone_number       | string  |                                |

### Association

- belongs_to :user

## cardテーブル

| Column             | Type    | Options                        |
| ------------------ | ------  | ------------------------------ |
| user_id            | integer | null: false, foreign_key: true |
| customer           | string  | null: false                    |
| card_id            | string  | null: false                    |

### Association

- belongs_to :user

## categoryテーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| name               | string  | null: false |
| ancestry           | string  |             |

### Association

has_many :items

## itemテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | integer    | null: false                    |
| description        | text       | null: false                    |
| status             | integer    | null: false                    |
| condition          | integer    | null: false                    |
| shipping           | references | null: false, foreign_key: true |
| judgment           | string     |                                |
| category           | references | null: false, foreign_key: true |
| brand              | references | null: false, foreign_key: true |
| seller_user        | references | null: false, foreign_key: true |

### Association
- belongs_to :user dependent: :destroy
- belongs_to :category dependent: :destroy
- belongs_to :brand dependent: :destroy
- has_many :images dependent: :destroy

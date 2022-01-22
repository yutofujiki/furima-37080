## usersテーブル

| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| email                | string     | null: false, unique: true      |
| nickname             | string     | null: false,                   |
| encrypted_password   | string     | null: false,                   |
| last_name_kanji      | string     | null: false,                   |
| first_name_kanji     | string     | null: false,                   |
| last_name_kana       | string     | null: false,                   |
| first_name_kana      | string     | null: false,                   |
| birthday             | date       | null: false,                   |

### Association
- has_many : items
- has_many : buyers

## itemsテーブル

| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| name                 | string     | null: false,                   |
| price                | integer    | null: false,                   |
| explanation          | text       | null: false,                   |
| category_id          | integer    | null: false,                   |
| situation_id         | integer    | null: false,                   |
| delivery_price_id     | integer    | null: false,                   |
| prefecture_id        | integer    | null: false,                   |
| shipping_day_id       | integer    | null: false,                   |
| user                 | reference  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one : buyer

## buyersテーブル

| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| user                 | reference  | null: false, foreign_key: true |
| item                 | reference  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to : item
- has_one : address

## addressesテーブル

| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| yubin_number         | string     | null: false,                   |
| prefecture_id        | integer    | null: false,                   |
| municipality         | string     | null: false,                   |
| address              | string     | null: false,                   |
| building             | string     |                                |
| phone_number         | string     | null: false,                   |
| buyer                | string     | null: false, foreign_key: true |

### Association
- belongs_to :buyer

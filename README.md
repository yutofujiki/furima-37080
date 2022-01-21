## usersテーブル

| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| email                | string     | null: false, unique: true      |
| nickname             | string     | null: false,                   |
| password             | string     | null: false,                   |
| namekanji            | string     | null: false,                   |
| namekana             | string     | null: false,                   |
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
| situation            | text       | null: false,                   |
| deliveryprice        | integer    | null: false,                   |
| shippingarea_id      | integer    | null: false,                   |
| shippingday_id       | integer    | null: false,                   |
| user                 | reference  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one : buyer

## buyersテーブル

| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| name                 | string     | null: false,                   |
| user                 | reference  | null: false, foreign_key: true |
| item                 | reference  | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to : item
- has_one : address

## addressesテーブル

| Column               | Type       | Options                        |
| ------               | ---------- | ------------------------------ |
| yubinnumber          | string     | null: false,                   |
| prefecture_id        | integer    | null: false,                   |
| municipality         | string     | null: false,                   |
| address              | string     | null: false,                   |
| building             | string     |                                |
| telnumber            | string     | null: false,                   |
| buyer                | string     | null: false, foreign_key: true |

### Association
- belongs_to :buyer

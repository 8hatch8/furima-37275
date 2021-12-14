## Usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | string | null: false               |

### Association
- has_many :items
- has_many :purchases
- has_many :likes
- has_many :comments


## Itemsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| status         | integer    | null: false                    |
| name           | string     | null: false                    |
| text           | text       | null: false                    |
| category       | integer    | null: false                    |
| condition      | integer    | null: false                    |
| price          | integer    | null: false                    |
| pay_method     | integer    | null: false                    |
| postage_payer  | integer    | null: false                    |
| prefecture     | string     | null: false                    |
| estimated_day  | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :purchase
- has_many   :likes
- has_many   :comments


## Purchasesテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| municipality | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| tel          | string     | null: false                    |
| name         | string     | null: false                    |
| item         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user


## Likesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user


## Commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user

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
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :contracts


## Itemsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| text                | text       | null: false                    |
| price               | integer    | null: false                    |
| category_id         | integer    | null: false                    |
| condition_id        | integer    | null: false                    |
| postage_payer_id    | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| preparation_days_id | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :contract
- belongs_to :category
- belongs_to :condition
- belongs_to :postage_payer
- belongs_to :prefecture
- belongs_to :preparation_days


## Contractsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one    :address


## Addressesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| tel           | string     | null: false                    |
| contract      | references | null: false, foreign_key: true |

### Association
- belongs_to :contract
- belongs_to :prefecture
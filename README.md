# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## Users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false unique:true|
| encrypted_password | string | null: false |
| kanji_first_name     | string | null: false |
| kanji_last_name     | string | null: false |
| katakana_first_name | string | null: false |
| katakana_last_name  | string | null: false |
| birthday          |date | null: false | 
・


### Association
- has_many :purchases
- has_many :products


## Purchasesテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user | references| null: false,foreign_key: true|
| product |references | null: false,foreign_key: true |

### Association

- belongs_to :product
- belongs_to :user
  has_one :location

## Locationsテーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| postal_code| string | null: false |
| prefecture_id | integer | null: false |
| municipality | string | null: false |
| address| string | null: false |
| building_name | string |        |
|phone_number| string | null: false |
|purchase|references | null: false ,foreign_key: true|

- belongs_to :purchase
 

## Productsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| product_name | string | null: false|
| product_description| text |null: false|
| category_id | integer |null: false|
| product_condition_id| integer |null: false|
| shipping_charges_id| integer |null: false|
|prefecture_id | integer |null: false |
| days_to_ship_id| integer |null: false|
| selling_price| integer |null: false|
| user | references | null: false, foreign_key: true |

### Association

- belongs_to :user
  has_one :purchase

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
## users テーブル

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
- has_many :Listing


## purchasesテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| users | refarences| null: false |
| purchases |refarences | null: false |

### Association

- has_many :listing
- has_many :users

## Addresesテーブル
| Column | Type   | Options     |
| ------ | ------ | ----------- |
| test   | string | null: false |
| payment_amount | string | null: false |
| expiration_date | string | null: false |
| security_code| string | null: false |
| postal_code| string | null: false |
| prefectures | string | null: false |
| municipality | string | null: false |
| addreses | string | null: false |
| building_name | string | null: false |
|phone_number| string | null: false |


- has_many :listing
- has_many :users

# listingテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| product_name| string |null: false, foreign_key: true |
| product_image | string |null: false, foreign_key: true |
|product_description| string |null: false, foreign_key: true |
| category | string |null: false, foreign_key: true |
| product_condition| string |null: false, foreign_key: true |
| shipping_charges| string |null: false, foreign_key: true |
|shipping_area| string |null: false, foreign_key: true |
| days_to_ship| string |null: false, foreign_key: true |
| selling_price| string |null: false, foreign_key: true |
| users | references | null: false, foreign_key: true |

### Association

- belongs_to :users
  belongs_to :purchases

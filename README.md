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
| email              | string | null: false |
| password           | string | null: false |
| hiraganna_name     | string | null: false |
| katakana_name     | string | null: false |
| birthday          | string | null: false | 
・


### Association

 has_many : :furima
- has_many :purchases
- has_many :Listing,through: furima
  has_many :comments


## purchasesテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :listing
- has_many :users, through: furima
- has_many :comments

## furima テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| purchases   | references | null: false, foreign_key: true |
| listings  | references | null: false, foreign_key: true |
|  users  | references | null: false, foreign_key: true |
| comments | references | null: false, foreign_key: true |

### Association

- belongs_to :purchases
- belongs_to :listings 
  belongs_to :users
  belongs_to :comments


# commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| purchases | string     |                                |
| listings   | references | null: false, foreign_key: true |
| users   | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :listings 
  belongs_to :purchases


# listingテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| purchases | string     |                                |
| commets  | references | null: false, foreign_key: true |
| users   | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :comments 
  belongs_to :purchases

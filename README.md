# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
# favorites DB設計
## usersテーブル
|column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|name|string|null:false|
### Association
- has_many :genres
- has_many :comments

## genresテーブル
|column|Type|Options|
|------|----|-------|
|text|text|null:false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :contents

## contentsテーブル
|column|Type|Options|
|------|----|-------|
|title|text|null: false|
### Association
- belongs_to :genre
- belongs_to :comment

### commentsテーブル
|column|Type|Options|
|------|----|-------|
|text|text|null:false|
|user_id|references|null:false, foreign_key: true|
|content_id|references|null:false, foreign_key: true|
### Association
belogns_to :user
belongs_to :content

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|e-mail|string|null: false|
|profile|text||
|image|string||
|living|string||
​|password|string|null: false|

### Association
- has_many :posts, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false, index: true|
|text|text|null: false, index: true|
|date|string|null: false|
|place|string|null: false|
|likes_count|integer||
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|user_id|references|null: false, foreign_key: true|
|post_id|references|null: false, foreign_key: true|
## Association
belongs_to :user
belongs_to :group


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|post_id|references|foreign_key: true|
|user_id|references|foreign_key: true|

### Association
belongs_to :user
belongs_to :group
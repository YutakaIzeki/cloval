
# サービスのコンセプト
- ユーザが自分のコーディネートを投稿し、それをユーザ同士で評価し合いオシャレ度を高めていくサービス

## 主な機能
### 評価機能について
ユーザーは2通りの方法で他のユーザのコーディネートを評価できる
  1. 「いいね」機能を使う
  1. 点数をつける
各々の評価に対して、ユーザのスコアを追加。スコアに応じてユーザのランクの設定。

### ユーザ登録機能
- ユーザはパスワード、メールアドレス、アイコン(任意)を設定してログイン


### タグ検索機能(実装予定)
- コーディネートにタグをつけ、同じタグがついた投稿を検索可能



# DB設計

## usersテーブル

|Column|Type|Option|
|:------:|----|------|
|name|string|null: false, unique:true|
|icon|text|default: sample.jpg|
|rank|integer|default: 0|
|score|integer|default: 0|

### Association
- has_many :coordinates



## coordinatesテーブル

|Column|Type|Option|
|:------:|----|------|
|user_id|references|null: false, foreign_key: true|
|image|text|null: false|
|good|integer|default: 0|
|evaluation_value|integer|default: 0|
|evaluation_number|integer|default: 0|


### Associaton
- belongs_to :user
- has_many :tags, through: :categories

## tagsテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false, unique: true, index: true|

### Associaton
- has_many :coordinates, through: :categories



## categoriesテーブル
|Column|Type|Option|
|------|----|------|
|coordinate_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|

### Associaton
- belongs_to :coordinate
- belongs_to :tag



## usersテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false, unique:true|
|icon|text|default: sample.jpg|
|rank|integer|default: 0|
|score|integer|default: 0|

### Association
- has_many :coordinates



## coordinatesテーブル

|Column|Type|Option|
|------|----|------|
|user_id|references|null: false, foreign_key: true|
|image|text|null: false|
|good|integer|default: 0|
|evaluation_value|integer|default: 0|
|evaluation_number|integer|default: 0|


### Associaton
- belongs_to :user

## tagsテーブル

|Column|Type|Option|
|------|----|------|
|name|string|null: false, unique: true|

### Associaton



## categoriesテーブル
|Column|Type|Option|
|------|----|------|
|coordinate_id|integer|null: false, foreign_key: true|
|tag_id|integer|null: false, foreign_key: true|

### Associaton

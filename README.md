# README
## Entertain yourself
# URL 
AWS:  52.192.10.151
heroku:  https://entertain-yourself.herokuapp.com/
# テスト用アカウント
ユーザー１：test@sample, testpass1
ユーザー２：test2@sample, testpass2
#Basic認証
ID:admin Pass:7777
# 利用方法
ユーザー登録をして、一人での過ごし方の提案をします。ログイン後、トップページの提案するボタンを押すことで提案作成画面へと遷移し、計画を提案することができます。トップページでは計画の一覧が表示されており、ユーザー登録をしていれば、各計画の表示部をクリックすることでその詳細へと遷移できます。詳細ページではその計画に補足として代案などをコメントすることができる他「いいね」をして評価をすることもできます。
## 概要
気軽に一人で楽しむ方法をシェアすることができ,その提案に対して他のユーザーが代替案や「いいね」を通して相互に一人時間を有意義にすることができます。
## 製作背景
コロナ禍にあり、多人数で休日を過ごすことがなかなか難しくなってきた背景や、サービス業など平日休みで友人と予定が合わなく一人で過ごすことが多くなっている中で、自分で自分の機嫌を取るように、一人でも楽しめる方法をシェアすることが時間の有効活用に繋がり、また人との繋がりにもなると考えたため。
# DEMO
# TOP画面での閲覧（詳細はユーザー登録が必要です）
https://gyazo.com/40fb97db7c055c67e5f3ad1dc1fee27e
# 詳細画面への遷移
https://gyazo.com/f5dc4fc1f83cf6d3356389a4ad3fcf06
# 計画投稿画面への遷移
https://gyazo.com/da72c7742a4cb114b5b0c98976fcd68d

# テーブル設計

## usersテーブル
| column             | type    | options    |
| nickname           | string  | null:false |
| email              | sting   | null:false |
| encrypted_password | string  | null:false |

## association
- has_many :plans
- has_many :supplements
- has_many :likes
- has_many :supplements

## plansテーブル
| column        | type        | options                       |
| name          | text        | null:false                    |
| user_id       | references  | null:false, foreign_key: true |
| description   | text        | null:false                    |
| genre_id      | integer     | null:false                    |
| budget_id     | integer     | null:false                    |
| location_id   | integer     |                               |
| time_id       | integer     | null:false                    |

## association
- belongs_to :user
- has_many :likes
- has_many :supplements
- belongs_to_active_hash :genre
- belongs_to_active_hash :budget
- belongs_to_active_hash :location
- belongs_to_active_hash :time

## supplementsテーブル
| column        | type       | options                       |
| plan_id       | references | null:false, foreign_key: true |
| user_id       | references | null:false, foreign_key: true |
| description   | text       | null:false                    |
| location_id   | integer    | null:false                    |
| genre_id      | integer    | null:false                    |
## association
- belongs_to :user
- belongs_to :plan
- has_many :likes

## likesテーブル
| column        | type       | options                       |
| user_id       | references | null:false, foreign_key: true |
| plan_id       | references | null:false, foreign_key: true |
| supplement_id | references | null:false, foreign_key: true |

## association
- belongs_to :user
- belongs_to :plan
- belongs_to :supplement

# ER図
[![Image from Gyazo](https://i.gyazo.com/6dbc3c9654beba219e05c22b5cb02e95.png)](https://gyazo.com/6dbc3c9654beba219e05c22b5cb02e95)

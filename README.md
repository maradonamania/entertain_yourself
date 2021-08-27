# README
# アプリケーション名
## Entertain yourself
## URL 
AWS:  52.192.10.151
heroku:  https://entertain-yourself.herokuapp.com/
## テスト用アカウント
ユーザー１：test@sample, testpass1
ユーザー２：test2@sample, testpass2
## Basic認証
ID:admin Pass:7777
# 想定利用者層
年齢：20代〜30代
職業：学生、社会人(主に独身の男女)
# 概要
気軽に一人で楽しむ方法をシェアすることができ,その提案に対して他のユーザーの代替案や「いいね」を通して相互に一人時間を有意義にすることを目的としています。
# 利用方法
ユーザー登録をして、一人での過ごし方の提案をします。ログイン後、トップページの提案するボタンを押すことで提案作成画面へと遷移し、計画を提案することができます。トップページでは計画の一覧が表示されており、ユーザー登録をしていれば、各計画の表示部をクリックすることでその詳細へと遷移できます。詳細ページではその計画に補足として代案などをコメントすることができる他「いいね」をして評価をすることもできます。
# 製作背景
コロナ禍にあり、多人数で休日を過ごすことがなかなか難しくなってきた背景や、サービス業など平日休みで友人と予定が合わなく一人で過ごすことが多くなっているような人が、自分で自分の機嫌を取るように、一人でも楽しめる方法をシェアすることが時間の有効活用に繋がり、また人との繋がりにもなると考えたため。
# DEMO
## TOP画面での閲覧（詳細はユーザー登録が必要です）
[![Image from Gyazo](https://i.gyazo.com/f7833fe766d4522a9a6d61ba3804f933.gif)](https://gyazo.com/f7833fe766d4522a9a6d61ba3804f933)
## 詳細画面への遷移
[![Image from Gyazo](https://i.gyazo.com/373880328e7ced2dc3f843392a488d20.gif)](https://gyazo.com/373880328e7ced2dc3f843392a488d20)
## 計画投稿画面への遷移
[![Image from Gyazo](https://i.gyazo.com/09b47feeaa07a2a71e7b7beb41eab9cb.gif)](https://gyazo.com/09b47feeaa07a2a71e7b7beb41eab9cb)
## 計画への補足提案
[![Image from Gyazo](https://i.gyazo.com/fe34c5abc7c43390445c4d03c4813574.gif)](https://gyazo.com/fe34c5abc7c43390445c4d03c4813574)
## 「いいね」機能
[![Image from Gyazo](https://i.gyazo.com/7cff261a478e976e1101eedd859a528f.gif)](https://gyazo.com/7cff261a478e976e1101eedd859a528f)
## 計画検索機能
[![Image from Gyazo](https://i.gyazo.com/849619924433c7eb0dfd16cc347ef62d.gif)](https://gyazo.com/849619924433c7eb0dfd16cc347ef62d)
## ユーザー詳細画面への遷移/ユーザー情報編集ページへの遷移
[![Image from Gyazo](https://i.gyazo.com/634c923e26bb1170ad152050c1edbe49.gif)](https://gyazo.com/634c923e26bb1170ad152050c1edbe49)


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

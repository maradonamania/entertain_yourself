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
一人で楽しむ方法を気軽に提案しシェアすることで,一人時間を有意義にすることを目的としています。また、ユーザー同士が他ユーザーの提案に対して代案や補足をすることでより良い提案を共有することができます。
# 利用方法
ユーザー登録をして、一人での過ごし方の提案をします。ログイン後、トップページの提案するボタンを押すことで提案作成画面へと遷移し、計画を提案することができます。トップページでは計画の一覧が表示されており、ユーザー登録をしていれば、各計画の表示部をクリックすることでその詳細へと遷移できます。詳細ページではその計画に補足として代案などをコメントすることができる他「いいね」をして評価をすることもできます。また、気に入った計画はお気に入り登録することができます。トップページ下部にいいね数のランキングもあります。
# 製作背景
コロナ禍にあり、多人数で休日を過ごすことがなかなか難しくなってきた背景や、サービス業など平日休みで友人と予定が合わなく一人で過ごすことが多くなっているような人が、自分で自分の機嫌を取るように、一人でも楽しめる方法をシェアすることが時間の有効活用に繋がり、また人との繋がりにもなると考えたため。(只今製作途中の段階にあります。)

# DEMO

## TOP画面での閲覧（詳細はユーザー登録が必要です）
[![Image from Gyazo](https://i.gyazo.com/3062fc47ead3fef4687f630e9c288616.gif)](https://gyazo.com/3062fc47ead3fef4687f630e9c288616)
## 計画詳細画面への遷移
[![Image from Gyazo](https://i.gyazo.com/1ff37c7207307a695e31461b8767151e.gif)](https://gyazo.com/1ff37c7207307a695e31461b8767151e)
## 計画投稿画面への遷移
[![Image from Gyazo](https://i.gyazo.com/61c21c8619dc86425197a0ac461c7d45.gif)](https://gyazo.com/61c21c8619dc86425197a0ac461c7d45)
## 計画への補足提案(非同期通信)
[![Image from Gyazo](https://i.gyazo.com/fe34c5abc7c43390445c4d03c4813574.gif)](https://gyazo.com/fe34c5abc7c43390445c4d03c4813574)
## 「いいね」機能(非同期通信)
[![Image from Gyazo](https://i.gyazo.com/eef180c28fb5c809d4fb814d618497b9.gif)](https://gyazo.com/eef180c28fb5c809d4fb814d618497b9)
## 計画検索機能(条件などの詳細設定可能)
[![Image from Gyazo](https://i.gyazo.com/68b2e9b84d747e66303aaa8fe3bba7cf.gif)](https://gyazo.com/68b2e9b84d747e66303aaa8fe3bba7cf)
## ユーザー詳細画面への遷移/ユーザー情報編集ページへの遷移
[![Image from Gyazo](https://i.gyazo.com/634c923e26bb1170ad152050c1edbe49.gif)](https://gyazo.com/634c923e26bb1170ad152050c1edbe49)
## ユーザー投稿一覧
[![Image from Gyazo](https://i.gyazo.com/eebe59855c88cd20340edc2e7e2c63d1.gif)](https://gyazo.com/eebe59855c88cd20340edc2e7e2c63d1)
## フォロー機能/フォロー、フォロワー詳細ページ表示
[![Image from Gyazo](https://i.gyazo.com/398897c6feb3ccfb7dd915f77ba8fc02.gif)](https://gyazo.com/398897c6feb3ccfb7dd915f77ba8fc02)
## パンくずリスト機能
[![Image from Gyazo](https://i.gyazo.com/4786befc80a94d539e8b41a982ea96b7.gif)](https://gyazo.com/4786befc80a94d539e8b41a982ea96b7)
## 計画お気に入り登録機能(非同期)/お気に入り計画一覧画面
[![Image from Gyazo](https://i.gyazo.com/fc7420d793495d3ac5ba30b757d01b37.gif)](https://gyazo.com/fc7420d793495d3ac5ba30b757d01b37)
[![Image from Gyazo](https://i.gyazo.com/81391a3de094a7c3d3453853fa627fc8.gif)](https://gyazo.com/81391a3de094a7c3d3453853fa627fc8)

##いいね数ランキング表示
[![Image from Gyazo](https://i.gyazo.com/86c68b42db9a053fb6bb592aa5f4740c.gif)](https://gyazo.com/86c68b42db9a053fb6bb592aa5f4740c)

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

## relationshipsテーブル
| column        | type       | options                       |
| user_id       | references | null:false, foreign_key: true |
| follow_id     | references | null:false, foreign_key: true |

## association
- belongs_to :user
- belongs_to :follow

## favoritesテーブル
| column        | type       | options                       |
| user_id       | references | null:false, foreign_key: true |
| plan_id       | references | null:false, foreign_key: true |

## association
- belongs_to :user
- belongs_to :plan

# ER図
[![Image from Gyazo](https://i.gyazo.com/66e39e6acf01a689fecabe83f70f9f56.png)](https://gyazo.com/66e39e6acf01a689fecabe83f70f9f56)

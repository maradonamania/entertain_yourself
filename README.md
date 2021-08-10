# README
# Entertain yourself
## 概要
気軽に一人で楽しむ方法をシェアすることができ,その提案に対して他のユーザーが代替案などもコメントすることができます。また、提案、代替案に関して『いいね』することができます。
## 製作背景
コロナ禍にあり、多人数で休日を過ごすことがなかなか難しくなってきた背景や、サービス業など平日休みで友人と予定が合わなく一人で過ごすことが多くなっている中で、自分で自分の機嫌を取るように、一人でも楽しめる方法をシェアすることが時間の有効活用に繋がり、また人との繋がりにもなると考えたため。

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


class Supplement < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :plan
  belongs_to_active_hash :location
  belongs_to_active_hash :genre

  with_options presence: true do
    validates :description
    validates :user_id
    validates :plan_id
    validates :location_id
    validates :genre_id
  end
end

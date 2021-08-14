class Plan < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :budget
  belongs_to_active_hash :location
  belongs_to_active_hash :expected_time
  has_one_attached :image
  belongs_to :user
  has_many :supplements

  with_options presence: true do
    validates :name
    validates :description
    with_options numericality: { other_than: 0, message: "can't be blank" } do
      validates :genre_id
      validates :budget_id
      validates :location_id
      validates :expected_time_id
    end
  end
end

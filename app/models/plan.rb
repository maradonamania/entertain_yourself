class Plan < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :budget
  belongs_to_active_hash :location
  belongs_to_active_hash :expected_time
  has_many_attached :images
  belongs_to :user
  has_many :supplements
  has_many :likes
  has_many :favorites, dependent: :destroy

  # def self.search(search)
  #   if search != ""
  #     Plan.where('description LIKE(?)',"%#{search}%")
  #   else
  #     Plan.all
  #   end
  # end

  with_options presence: true do
    validates :name
    validates :description
    with_options numericality: { other_than: 0, message: 'を入力してください' } do
      validates :genre_id
      validates :budget_id
      validates :location_id
      validates :expected_time_id
    end
  end
end

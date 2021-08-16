class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :plans
  has_many :likes
  def already_liked?(plan)
    likes.exists?(plan_id: plan.id)
  end

  with_options presence: true do
    validates :nickname
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
end

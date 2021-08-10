class Budget < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '1000円以下' },
    { id: 2, name: '3000円以下' },
    { id: 3, name: '5000円以下' },
    { id: 4, name: '10000円以下' },
    { id: 5, name: '20000円以下' },
    { id: 6, name: '20000円以上' }
  ]
  include ActiveHash::Associations
  has_many :plans
end
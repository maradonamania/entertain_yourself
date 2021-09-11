class Budget < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '〜1000円' },
    { id: 2, name: '1000〜3000円' },
    { id: 3, name: '3000〜5000円' },
    { id: 4, name: '5000〜10000円' },
    { id: 5, name: '10000〜20000円' },
    { id: 6, name: '20000〜30000円' },
    { id: 7, name: '30000円〜' }
  ]
  include ActiveHash::Associations
  has_many :plans
end

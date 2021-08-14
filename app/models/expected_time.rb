class ExpectedTime < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '1時間〜2時間' },
    { id: 2, name: '2時間〜3時間' },
    { id: 3, name: '4時間〜5時間' },
    { id: 4, name: '半日' },
    { id: 5, name: '1日以上' }
  ]
  include ActiveHash::Associations
  has_many :plans
end

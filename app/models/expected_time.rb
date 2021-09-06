class ExpectedTime < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '30分' },
    { id: 2, name: '1〜2時間' },
    { id: 3, name: '2〜3時間' },
    { id: 4, name: '3〜4時間' },
    { id: 5, name: '4〜5時間' },
    { id: 6, name: '半日' },
    { id: 7, name: '1日' },
    { id: 8, name: '2日以上' }
  ]
  include ActiveHash::Associations
  has_many :plans
end

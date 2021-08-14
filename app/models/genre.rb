class Genre < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '買い物' },
    { id: 2, name: '運動' },
    { id: 3, name: '散歩' },
    { id: 4, name: 'ゲーム' },
    { id: 5, name: '勉強' },
    { id: 6, name: 'エンタメ' },
    { id: 7, name: 'グルメ' },
    { id: 8, name: '旅行' },
    { id: 9, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :plans
  has_many :supplements
end

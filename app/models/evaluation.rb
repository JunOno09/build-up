class Evaluation < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '大変満足' },
    { id: 3, name: '満足' },
    { id: 4, name: '普通' },
    { id: 5, name: '良くなかった' },
    { id: 6, name: '大変良くなかった' }
    ]

  include ActiveHash::Associations
  has_many :records

  end
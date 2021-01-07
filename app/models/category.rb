class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '未就学児' },
    { id: 3, name: '小学１年生' },
    { id: 4, name: '小学２年生' },
    { id: 5, name: '小学３年生' },
    { id: 6, name: '小学４年生' },
    { id: 7, name: '小学５年生' },
    { id: 8, name: '小学６年生' },
    { id: 9, name: '中学１年生' },
    { id: 10, name: '中学２年生' },
    { id: 11, name: '中学３年生' },
    { id: 12, name: '高校１年生' },
    { id: 13, name: '高校２年生' },
    { id: 14, name: '高校３年生' },
    { id: 15, name: '大学生' },
    { id: 16, name: '社会人' },
    { id: 17, name: 'その他' }
    ]
    

  include ActiveHash::Associations
  has_many :records

  end

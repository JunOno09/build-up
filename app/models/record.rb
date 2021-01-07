class Record < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :evaluation

  with_options presence: true do
    validates :tr_content
    validates :tr_theme
    validates :image
    validates :event
    validates :tr_day
    validates :mvp
    validates :mvp_reason
  end
  
  with_options presence: true,numericality: { other_than: 1 }  do 
    validates :category_id 
    validates :evaluation_id
  end


end

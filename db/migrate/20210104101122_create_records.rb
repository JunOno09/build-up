class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :tr_theme          , null: false
      t.text :tr_content          , null: false
      t.integer :category_id      , null: false
      t.integer :evaluation_id    , null: false
      t.date :tr_day              , null: false 
      t.string :mvp               , null: false 
      t.string :mvp_reason        , null: false
      t.string :event             , null: false
      t.references :user          , foreign_key: true
      t.timestamps
    end
  end
end

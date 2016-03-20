class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.date :publication_date
      t.datetime :review_date

      t.timestamps
    end
  end
end

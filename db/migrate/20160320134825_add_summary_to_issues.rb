class AddSummaryToIssues < ActiveRecord::Migration
  def change
  	add_column :issues, :summary, :text
  end
end

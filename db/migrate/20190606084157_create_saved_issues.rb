class CreateSavedIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_issues do |t|
      t.string :user_name
      t.string :repo_name

      t.timestamps
    end
  end
end

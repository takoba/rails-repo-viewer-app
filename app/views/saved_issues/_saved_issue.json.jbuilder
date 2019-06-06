json.extract! saved_issue, :id, :user_name, :repo_name, :created_at, :updated_at
json.url saved_issue_url(saved_issue, format: :json)

json.extract! task_comment, :id, :user_id, :task_id, :comment, :created_at, :updated_at
json.url task_comment_url(task_comment, format: :json)
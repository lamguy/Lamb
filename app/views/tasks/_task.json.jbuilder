json.extract! task, :id, :name, :due, :created_at, :updated_at
json.url task_url(task, format: :json)
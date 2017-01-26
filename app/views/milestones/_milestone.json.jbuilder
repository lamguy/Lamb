json.extract! milestone, :id, :project_id, :name, :description, :due, :created_at, :updated_at
json.url milestone_url(milestone, format: :json)
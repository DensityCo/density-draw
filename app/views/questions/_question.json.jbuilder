json.extract! question, :id, :game_id, :user_id, :prompt, :image_url, :created_at, :updated_at
json.url question_url(question, format: :json)

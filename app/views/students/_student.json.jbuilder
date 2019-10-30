json.extract! student, :id, :first_name, :last_name, :middle_name, :facebook, :instagram, :vkontakte, :youtube, :hse_portfolio, :created_at, :updated_at
json.url student_url(student, format: :json)

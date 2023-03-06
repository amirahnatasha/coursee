json.extract! course, :id, :courseID, :coursename, :distance, :time, :comment, :imageLink, :created_at, :updated_at
json.url course_url(course, format: :json)

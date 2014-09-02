json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :department_id, :name, :email, :phone, :message
  json.url feedback_url(feedback, format: :json)
end

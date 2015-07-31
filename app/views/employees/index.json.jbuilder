json.array!(@employees) do |employee|
  json.extract! employee, :id, :name, :surname, :age, :date_of_birth
  json.url employee_url(employee, format: :json)
end

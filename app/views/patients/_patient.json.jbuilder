json.extract! patient, :id, :name, :surname, :pesel, :created_at, :updated_at
json.url patient_url(patient, format: :json)

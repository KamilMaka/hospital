Bill::HABTM_BillItems.create!([
  {bill_id: 2, bill_item_id: 1}
])
BillItem::HABTM_Bill.create!([
  {bill_id: 2, bill_item_id: 1}
])
Address.create!([
  {addressable_type: "Patient", addressable_id: 1, city: "Żytnia", street_name: "Czysta", street_no: "21", postal_code: "54-098"},
  {addressable_type: "Staff", addressable_id: 1, city: "Ostrowo", street_name: "Cięta", street_no: "54", postal_code: "22-456"},
  {addressable_type: "Patient", addressable_id: 5, city: "Czysta", street_name: "Płynna", street_no: "21", postal_code: "44-202"},
  {addressable_type: "Staff", addressable_id: 2, city: "Pigułowo", street_name: "Wenflonowa", street_no: "22", postal_code: "98-331"}
])
Appointment.create!([
  {doctor_id: 1, nurse_id: nil, reservation_id: 1}
])
Bill.create!([
  {appointment_id: 1, is_paid: true, paid_date: "2019-03-31 11:57:09"}
])
BillItem.create!([
  {name: "Reanimacja po zapaści alkoholowej", price: "500.0"}
])
Patient.create!([
  {name: "Józek", surname: "Alkoholik", pesel: "55621254478"},
  {name: "Stanisław", surname: "Pijok", pesel: "5812025024578"}
])
Reservation.create!([
  {reservation_time: "2020-03-31 09:26:00", patient_id: 1}
])
Staff.create!([
  {name: "Kazimierz", surname: "Skalpel", pesel: "45121214122", occupation: "doctor"},
  {name: "Kazimiera", surname: "Piguła", pesel: "2211215648789", occupation: "nurse"}
])

# frozen_string_literal: true

User.new(
  email: "maka.akamil@gmail.com", password: "abcbiedronka", password_confirmation: "abcbiedronka", birth_date: "2019-04-14", pesel: "", admin: true
).save(validate: false)

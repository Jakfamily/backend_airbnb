require 'faker'

# Détruire ta base actuelle
Accommodation.destroy_all
Reservation.destroy_all
User.destroy_all
City.destroy_all


# Créer 20 utilisateurs
5.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone_number: "+33" + Faker::PhoneNumber.subscriber_number(length: 9),
    description: Faker::Lorem.paragraph
  )
end

# Créer 10 villes
10.times do
  City.create(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code_by_state("FR")
  )
end

# Créer 5 réservations dans le passé
5.times do
  Reservation.create!(
    start_date: Faker::Time.between_dates(from: Date.today - 30, to: Date.today - 1, period: :day),
    end_date: Faker::Time.between_dates(from: Date.today - 30, to: Date.today - 1, period: :day),
    guest: User.order("RANDOM()").first,
    accomodation: accommodation
  )
end

# Créer 5 réservations dans le futur
5.times do
  Reservation.create!(
    start_date: Faker::Time.between_dates(from: Date.today + 1, to: Date.today + 30, period: :day),
    end_date: Faker::Time.between_dates(from: Date.today + 1, to: Date.today + 30, period: :day),
    guest: User.order("RANDOM()").first,
    accomodation: accommodation
  )
end



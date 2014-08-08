# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Participants table
50.times do |n|
  Participant.create(
    fname: Faker::Name.first_name,
    lname: Faker::Name.last_name,
    street_address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip,
    country: Faker::Address.country,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email,
    twitter_link: "@twitter_#{n}",
    facebook_link: Faker::Internet.url,
  )
end

# Fest table
Fest.create(
    name: Faker::Company.name,
    start_date: Date.today + 3.months,
    end_date: Date.today + 3.months + 4.days
)

Fest.create(
    name: Faker::Company.name,
    start_date: Date.today + 9.months,
    end_date: Date.today + 9.months + 4.days
)

# Role Types table
role_types = ["volunteer", "performer", "employee", "vendor", "customer"]
role_types.each do |rt|
  RoleType.create(
    name: rt )
end

# Tickets Types table
ticket_types = [
    "4 Day Adult",
    "Camping: Tent",
    "Camping: Vehicle",
    "4 Day Youth",
    "Parking Free",
    "Parking Performer",
    "Thursday Adult",
    "Friday Adult",
    "Saturday Adult",
    "Sunday Adult" ]
ticket_status = ["earlybird", "advanced", "holiday", "gate price"]
price = [100, 60, 40, 0]

ticket_types.each do |tt|
  ticket_status.each do |ts|
    TicketType.create(
      name: tt,
      sale_status: ts,
      price: price.sample,
      sku: Faker::Number.number(10),
      fest_id: Fest.first.id
    )
  end
end

Admin.create(email: "admin@admin.com",
             password: "password",
             password_confirmation: "password"
)

Volunteer.create(email: "volunteer@volunteer.com",
              password: "password",
              password_confirmation: "password"
)
# Tickets table
qty = [0, 0, 0, 0, 0, 1, 2, 3, 4, 5]
20.times do |n|
  Ticket.create(
    online_order_id: Faker::Number.number(5))
    
end

# fest_participation_role_type
10.times do |n|
  FestParticipantRoleType.create(
    participant_id:  n,
    role_id: RoleType.where(name: "customer").first.id,
    fest_id: 1
  )
end


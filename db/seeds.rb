# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

connection = ActiveRecord::Base.connection()
# connection.execute("delete from action_text_rich_texts");
connection.execute("delete from active_storage_attachments");
connection.execute("delete from active_storage_blobs");
# connection.execute("delete from friendly_id_slugs");
connection.close()

MedicalHistory.delete_all 
Dependent.delete_all 
User.delete_all 

user1 = User.create({
  full_name: "Tom",
  email: "test@test.com",
  phone: "1234567890",
  country: "India",
  date_of_birth: 20.years.ago,
  password_digest: BCrypt::Password.create('123456')
})


dep1 = Dependent.create!({
  user: user1,
  relationship: "Mother",
  name: "Toms mother",
  email: "tm@test.com",
  phone: "4312567897",
  blood_group: "B+",
  date_of_birth: 50.years.ago,
  weight: "60kg",
  height: "145 inch"
})

dep2 = Dependent.create!({
  user: user1,
  relationship: "Father",
  name: "Toms Father",
  email: "tf@test.com",
  phone: "3312567897",
  blood_group: "A+",
  date_of_birth: 52.years.ago,
  weight: "65kg",
  height: "155 inch"
})


MedicalHistory.create!({
  user: user1,
  illness: "Fever",
  drname: "Dr. Strange",
  medicine: "Paracetomol",
  startdate: DateTime.now,
  enddate: 10.days.from_now,
  dosage_amount: "1 dosage",
  dosage_frequency: "daily-twice",
  dosage_time: "2pm",
  email_notify: true
})

MedicalHistory.create!({
  user: user1,
  dependent: dep1,
  illness: "Cough",
  drname: "Dr. Iron",
  medicine: "Tablet",
  startdate: DateTime.now,
  enddate: 12.days.from_now,
  dosage_amount: "2 dosage",
  dosage_frequency: "daily-twice",
  dosage_time: "1pm",
  email_notify: true
})

MedicalHistory.create!({
  user: user1,
  dependent: dep2,
  illness: "Sore Throat",
  drname: "Dr. Superman",
  medicine: "Syrup",
  startdate: DateTime.now,
  enddate: 10.days.from_now,
  dosage_amount: "2 dosage",
  dosage_frequency: "daily-thrice",
  dosage_time: "2pm",
  email_notify: true
})

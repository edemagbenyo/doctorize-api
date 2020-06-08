# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Users
admin = User.create!({name: 'Administrator', username: 'admin',email: 'admin@gmail.com', password: '111111', status: 'active'})
User.create({name: 'Jackson Patient1', username: 'patient', email: 'patient1@gmail.com', password: '111111', status: 'active'})
doctor = User.create({name: 'Michael Doctor1', username: 'doctor', email: 'doctor1@gmail.com', password: '111111', status: 'active'})
doctor2 = User.create({name: 'Sam Doctor1', username: 'doctor2', email: 'doctor1@gmail.com', password: '111111', status: 'active'})
doctor3 = User.create({name: 'John Doctor1', username: 'doctor3', email: 'doctor1@gmail.com', password: '111111', status: 'active'})
doctor4 = User.create({name: 'Daniel Doctor1', username: 'doctor4', email: 'doctor1@gmail.com', password: '111111', status: 'active'})

# Specialities
specialities = [
  {name: 'Pediatry', description: 'Pediatry doctor', created_by: 'Administrator', user_id: admin.id },
  {name: 'Optometry', description: 'Op doctor', created_by: 'Administrator', user_id: admin.id },
  {name: 'Obs and Gynae', description: 'Obs and Gynae doctor', created_by: 'Administrator', user_id: admin.id },
  {name: 'Psychatrist', description: 'Psychatrist doctor', created_by: 'Administrator', user_id: admin.id },
  {name: 'ENT', description: 'ENT doctor', created_by: 'Administrator', user_id: admin.id }
]
specialities.each do |spe|
  Speciality.create!(spe)
end
# Doctors
Doctor.create!({name: 'Michael', hospital: 'St John of God', age: '40', experience_year: '10', speciality_id: 1, user_id:doctor.id})
Doctor.create!({name: 'Sam', hospital: 'St John of God', age: '32', experience_year: '12', speciality_id: 2, user_id:doctor2.id})
Doctor.create!({name: 'John', hospital: 'St John of God', age: '45', experience_year: '13', speciality_id: 3, user_id:doctor3.id})
Doctor.create!({name: 'Daniel', hospital: 'St John of God', age: '30', experience_year: '5', speciality_id: 4, user_id:doctor4.id})
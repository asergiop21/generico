# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Usuario por defecto
user = User.create!(
  name: 'Administrator',
  lastname: 'Administrator',
  username: 'admin',
  email: 'admin@ispweb.com',
  role: 'Admin'
  #  language: 'es',
  password: 'admin1',
  password_confirmation: 'admin1',
 # admin: true,
 # enable: true
)


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
# Create an Admins
#
User.create(
  name: 'Администратор 1',
  email: 'admin@test.com',
  password: 'password123',
  password_confirmation: 'password123',
  is_admin: true
)

User.create(
  name: 'Администратор 2',
  email: 'admin_2@test.com',
  password: 'password123',
  password_confirmation: 'password123',
  is_admin: true
)

User.create(
  name: 'Администратор 3',
  email: 'admin_3@test.com',
  password: 'password123',
  password_confirmation: 'password123',
  is_admin: true
)
# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Iniciando o processo de seeding..."

kpmg = Company.find_or_create_by!(name: "KPMG")
pwc = Company.find_or_create_by!(name: "PwC")

puts "Empresas criadas."

User.find_or_create_by!(email: "accountant@kpmg.com") do |user|
  user.password = "password"
  user.company = kpmg
end

User.find_or_create_by!(email: "eavesdropper@pwc.com") do |user|
  user.password = "password"
  user.company = pwc
end

puts "Usuários criados."
puts "Seeding finalizado."
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

User.find_or_create_by!(email: "user@kpmg.com") do |user|
  user.password = "password"
  user.company = kpmg
end

User.find_or_create_by!(email: "user@pwc.com") do |user|
  user.password = "password"
  user.company = pwc
end

puts "Usuários criados."
puts "Criando quotes e line item dates..."

quote1_kpmg = Quote.find_or_create_by!(name: "Primeira cotação da KPMG", company: kpmg)
LineItemDate.find_or_create_by!(quote: quote1_kpmg, date: Date.today)
LineItemDate.find_or_create_by!(quote: quote1_kpmg, date: Date.today + 1.day)

quote2_kpmg = Quote.find_or_create_by!(name: "Segunda cotação da KPMG", company: kpmg)
LineItemDate.find_or_create_by!(quote: quote2_kpmg, date: Date.today + 2.days)
LineItemDate.find_or_create_by!(quote: quote2_kpmg, date: Date.today + 3.days)

quote1_pwc = Quote.find_or_create_by!(name: "Primeira cotação da PwC", company: pwc)
LineItemDate.find_or_create_by!(quote: quote1_pwc, date: Date.today)
LineItemDate.find_or_create_by!(quote: quote1_pwc, date: Date.today + 1.day)

quote2_pwc = Quote.find_or_create_by!(name: "Segunda cotação da PwC", company: pwc)
LineItemDate.find_or_create_by!(quote: quote2_pwc, date: Date.today + 2.days)
LineItemDate.find_or_create_by!(quote: quote2_pwc, date: Date.today + 3.days)

puts "Quotes e line item dates criados."
puts "Seeding finalizado."

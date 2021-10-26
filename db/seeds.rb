# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cadastrando moedas..."
=begin
#Esse metodo serve pra encontrar ou criar dados, se já existe, ele mostra pra você, se não existe ele ira criar
Coin.find_or_create_by!(
    description: "Bitcoin",
    acronym: "BTC",
    url_image: "https://assets.chinatechnews.com/wp-content/uploads/bitcoin-logo.jpg"
)
=end
conis = [
            {
                description: "Bitcoin",
                acronym: "BTC",
                url_image: "https://assets.chinatechnews.com/wp-content/uploads/bitcoin-logo.jpg"
            },
            {
                description: "Dogecoin",
                acronym: "DOGE",
                url_image: "https://png.pngtree.com/png-clipart/20210427/ourlarge/pngtree-dogecoin-on-a-transparent-background-png-image_3246813.jpg"
            },
            {
                description: "TRON",
                acronym: "TRX",
                url_image: "https://www.pikpng.com/pngl/m/589-5895518_tron-coin-logo-png-tron-logo-clipart.png"
            }
        ]

conis.each do |coin|
    Coin.find_or_create_by!(coin)
end
puts "Moedas cadastradas com sucesso!"
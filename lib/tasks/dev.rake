namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    #%x = permite executar codigo ruby no terminal
    if Rails.env.development?
      show_spinner("Apagando Bando de Dados") {%x(rails db:drop)}
      show_spinner("Criando Bando de Dados") {%x(rails db:create)}
      show_spinner("Migrando Bando de Dados") {%x(rails db:migrate)}
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)
    else
      puts "você não esta em ambiente de desenvolvimento!"
    end
  end
  desc "Cadastra as Moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando Moedas") do
    conis = [
      {
          description: "Bitcoin",
          acronym: "BTC",
          url_image: "https://assets.chinatechnews.com/wp-content/uploads/bitcoin-logo.jpg",
          mining_types: MiningType
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
      },
      {
          description: "Solana",
          acronym: "SOL",
          url_image: "https://solana.com/branding/new/exchange/exchange-sq-white.png"
      },
      {
          description: "Axie Infinity",
          acronym: "AXS",
          url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/6783.png"
      }
  ]
    conis.each do |coin|
    Coin.find_or_create_by!(coin)
    end
  end
end

desc "Cadastro dos Tipos de Mineração"
task add_mining_types: :environment do
  show_spinner("Cadastrando Tipos de Mineração") do
    mining_types = [
      { description: "Proof of Work", 
        acronym: "PoW"
      },
      { description: "Proof of Stake",
        acronym: "PoS"
      },
      { description: "Proof of Capacity",
        acronym: "PoC"
      }
]

    mining_types.each do |type|
      MiningType.find_or_create_by!(type)
    end
  end
end

private
  def show_spinner(msg_inicio, msg_final = "Concluido")
    spinner = TTY::Spinner.new("[:spinner] #{msg_inicio}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_final})")
  end
end

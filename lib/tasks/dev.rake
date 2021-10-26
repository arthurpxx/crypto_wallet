namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    #%x = permite executar codigo ruby no terminal
    if Rails.env.development?
      show_spinner("Apagando Bando de Dados") {%x(rails db:drop)}
      show_spinner("Criando Bando de Dados") {%x(rails db:create)}
      show_spinner("Migrando Bando de Dados") {%x(rails db:migrate)}
      show_spinner("Semeando Bando de Dados") {%x(rails db:seed)}
    else
      puts "você não esta em ambiente de desenvolvimento!"
    end
  end

  def show_spinner(msg_inicio, msg_final = "Concluido")
    spinner = TTY::Spinner.new("[:spinner] #{msg_inicio}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_final})")
  end
end

class AddMiningTypeToCoins < ActiveRecord::Migration[6.1]
  def change 
    #foreign é uma chave estrangeira/ um referencia da tabela tipos de mineração a moedas
    #Nome da tabela que vai ficar o campo(coins)/O nome do campo(mining_type)/Estamos falando que é uma chave estrageira(foreign_key), por convenção o metodo ira procurar uma tabela com o nome(mining_types)no plural.
    #Isso foi feito na tabela
    add_reference :coins, :mining_type, foreign_key: true
  end
end

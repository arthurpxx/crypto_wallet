class MiningType < ApplicationRecord
    #has_many = associação inversa do belongs_to
    #Belongs_to esta fazendo refencia a model mining_type e has_many esta fazendo uma associação a model coins
    has_many :coins
end
